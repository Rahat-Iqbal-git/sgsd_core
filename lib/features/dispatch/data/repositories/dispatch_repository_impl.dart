import 'package:drift/drift.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:sgsd_core/core/error/failure.dart';
import 'package:sgsd_core/features/dispatch/data/datasources/dispatch_remote_datasource.dart';
import 'package:sgsd_core/features/dispatch/data/dtos/user_dto.dart';
import 'package:sgsd_core/features/dispatch/data/mappers/dispatch_item_row_mapper.dart';
import 'package:sgsd_core/features/dispatch/domain/entities/dispatch_item.dart';
import 'package:sgsd_core/features/dispatch/domain/repositories/dispatch_repository.dart';
import 'package:sgsd_core/services/db/app_database.dart';

@LazySingleton(as: DispatchRepository)
class DispatchRepositoryImpl implements DispatchRepository {
  DispatchRepositoryImpl(this._remoteDataSource, this._database);

  final DispatchRemoteDataSource _remoteDataSource;
  final AppDatabase _database;

  @override
  Stream<List<DispatchItem>> watchDispatchItems() {
    return (_database.select(
      _database.dispatchItems,
    )..orderBy([(t) => OrderingTerm(expression: t.id)])).watch().map(
      (rows) => rows.map((row) => row.toEntity()).toList(),
    );
  }

  @override
  Future<Either<Failure, Unit>> refreshDispatchItems() async {
    final result = await _remoteDataSource.getUsers();

    return switch (result) {
      Left(value: final failure) => Left(failure),
      Right(value: final dtos) => _upsertAll(dtos),
    };
  }

  Future<Either<Failure, Unit>> _upsertAll(List<UserDto> dtos) async {
    try {
      await _database.batch((batch) {
        for (final dto in dtos) {
          final entity = dto.toEntity();
          batch.insert(
            _database.dispatchItems,
            _insertCompanion(dto, entity),
            onConflict: DoUpdate(
              (_) => _updateCompanion(dto, entity),
              target: [_database.dispatchItems.id],
            ),
          );
        }
      });
      return const Right(unit);
    } on Object catch (e) {
      return Left(CacheFailure('Failed to cache dispatch items: $e'));
    }
  }

  DispatchItemsCompanion _insertCompanion(UserDto dto, DispatchItem entity) {
    return DispatchItemsCompanion(
      id: Value(dto.id),
      recipientName: Value(dto.name),
      recipientEmail: Value(dto.email),
      remoteStatus: Value(dto.status),
      destLat: Value(entity.destination.latitude),
      destLng: Value(entity.destination.longitude),
      localStatus: Value(entity.status.name),
      updatedAt: Value(DateTime.now()),
    );
  }

  DispatchItemsCompanion _updateCompanion(UserDto dto, DispatchItem entity) {
    return DispatchItemsCompanion(
      recipientName: Value(dto.name),
      recipientEmail: Value(dto.email),
      remoteStatus: Value(dto.status),
      destLat: Value(entity.destination.latitude),
      destLng: Value(entity.destination.longitude),
      updatedAt: Value(DateTime.now()),
    );
  }
}
