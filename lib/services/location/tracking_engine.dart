import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:sgsd_core/services/location/breadcrumb.dart';
import 'package:sgsd_core/services/location/tracking_band.dart';
import 'package:sgsd_core/services/location/tracking_sensors.dart';
import 'package:sgsd_core/services/location/velocity_elasticity_policy.dart';

enum TrackingStatus { stopped, stationary, moving }

const _stationaryAfter = Duration(seconds: 60);

@lazySingleton
class TrackingEngine {
  TrackingEngine(this._sensors);

  final TrackingSensors _sensors;

  final _breadcrumbsController = StreamController<Breadcrumb>.broadcast();
  final _statusController = StreamController<TrackingStatus>.broadcast();

  StreamSubscription<Breadcrumb>? _positionSub;
  StreamSubscription<void>? _motionSub;

  TrackingBand _band = TrackingBand.stationary;
  DateTime? _stillSince;
  var _running = false;

  Stream<Breadcrumb> get breadcrumbs => _breadcrumbsController.stream;
  Stream<TrackingStatus> get status => _statusController.stream;

  Future<bool> start() async {
    if (_running) {
      return true;
    }

    if (!await _sensors.ensurePermission()) {
      return false;
    }

    _running = true;
    _enterMoving();
    return true;
  }

  Future<void> stop() async {
    await _positionSub?.cancel();
    await _motionSub?.cancel();
    _positionSub = null;
    _motionSub = null;
    _running = false;
    _emitStatus(TrackingStatus.stopped);
  }

  Future<void> dispose() async {
    await stop();
    await _breadcrumbsController.close();
    await _statusController.close();
  }

  void _enterMoving() {
    unawaited(_motionSub?.cancel());
    _motionSub = null;
    _band = TrackingBand.walking;
    _stillSince = null;
    _subscribePositions();
    _emitStatus(TrackingStatus.moving);
  }

  void _enterStationary() {
    unawaited(_positionSub?.cancel());
    _positionSub = null;
    _stillSince = null;
    _motionSub = _sensors.motion().listen((_) => _onMotion());
    _emitStatus(TrackingStatus.stationary);
  }

  void _subscribePositions() {
    unawaited(_positionSub?.cancel());
    _positionSub = _sensors.positions(_band).listen(_onBreadcrumb);
  }

  void _onBreadcrumb(Breadcrumb breadcrumb) {
    if (!_breadcrumbsController.isClosed) {
      _breadcrumbsController.add(breadcrumb);
    }

    final next = bandFor(speedMps: breadcrumb.speedMps, current: _band);
    if (next != _band) {
      _band = next;
      _subscribePositions();
    }

    if (next == TrackingBand.stationary) {
      _stillSince ??= breadcrumb.recordedAt;
      if (breadcrumb.recordedAt.difference(_stillSince!) >= _stationaryAfter) {
        _enterStationary();
      }
    } else {
      _stillSince = null;
    }
  }

  void _onMotion() {
    _enterMoving();
  }

  void _emitStatus(TrackingStatus value) {
    if (!_statusController.isClosed) {
      _statusController.add(value);
    }
  }
}
