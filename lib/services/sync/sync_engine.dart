import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:drift/drift.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:sgsd_core/services/db/app_database.dart';
import 'package:sgsd_core/services/location/breadcrumb.dart';
import 'package:sgsd_core/services/location/tracking_engine.dart';
import 'package:sgsd_core/services/network/gorest_api_client.dart';
import 'package:sgsd_core/services/sync/backoff_policy.dart';

const _flushInterval = Duration(seconds: 5);
const _drainBatchSize = 20;
// Stand-in PATCH target: GoRest has no logs endpoint, so breadcrumb sync
// writes to a fixed seed user's record instead (CLAUDE.md's pinned decision).
const _syncTargetUserId = 1001;

@lazySingleton
class SyncEngine {
  SyncEngine(this._trackingEngine, this._database, this._apiClient) {
    _trackingEngine.breadcrumbs.listen(_buffer.add);
    Timer.periodic(_flushInterval, (_) => _flush());
    Connectivity().onConnectivityChanged.listen(_onConnectivityChanged);
    unawaited(_checkInitialConnectivity());
  }

  final TrackingEngine _trackingEngine;
  final AppDatabase _database;
  final GoRestApiClient _apiClient;

  final List<Breadcrumb> _buffer = [];

  Future<void> _checkInitialConnectivity() async {
    _onConnectivityChanged(await Connectivity().checkConnectivity());
  }

  void _onConnectivityChanged(List<ConnectivityResult> results) {
    if (results.any((result) => result != ConnectivityResult.none)) {
      unawaited(_drain());
    }
  }

  Future<void> _flush() async {
    if (_buffer.isEmpty) {
      return;
    }

    final snapshot = List<Breadcrumb>.of(_buffer);
    _buffer.clear();

    await _database.batch((batch) {
      batch.insertAll(
        _database.breadcrumbs,
        snapshot.map(
          (breadcrumb) => BreadcrumbsCompanion.insert(
            lat: breadcrumb.position.latitude,
            lng: breadcrumb.position.longitude,
            speed: breadcrumb.speedMps,
            accuracy: breadcrumb.accuracyM,
            recordedAt: breadcrumb.recordedAt,
          ),
        ),
      );
    });
  }

  Future<void> _drain() async {
    final now = DateTime.now();
    final table = _database.breadcrumbs;
    final rows =
        await (_database.select(table)
              ..where(
                (t) =>
                    t.synced.equals(false) &
                    (t.nextAttemptAt.isNull() |
                        t.nextAttemptAt.isSmallerOrEqualValue(now)),
              )
              ..orderBy([(t) => OrderingTerm(expression: t.id)])
              ..limit(_drainBatchSize))
            .get();

    if (rows.isEmpty) {
      return;
    }

    final result = await _apiClient.patch<dynamic>(
      '/users/$_syncTargetUserId',
      data: {'status': 'active'},
    );

    switch (result) {
      case Right():
        await _database.batch((batch) {
          for (final row in rows) {
            batch.update(
              table,
              const BreadcrumbsCompanion(synced: Value(true)),
              where: (t) => t.id.equals(row.id),
            );
          }
        });
      case Left():
        await _database.batch((batch) {
          for (final row in rows) {
            final newAttempts = row.attempts + 1;
            batch.update(
              table,
              BreadcrumbsCompanion(
                attempts: Value(newAttempts),
                nextAttemptAt: Value(
                  DateTime.now().add(backoffDelay(newAttempts)),
                ),
              ),
              where: (t) => t.id.equals(row.id),
            );
          }
        });
    }
  }
}
