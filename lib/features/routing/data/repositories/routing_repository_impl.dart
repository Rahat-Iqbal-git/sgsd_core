import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:sgsd_core/core/error/failure.dart';
import 'package:sgsd_core/core/geo/geo_point.dart';
import 'package:sgsd_core/features/routing/data/datasources/ors_remote_datasource.dart';
import 'package:sgsd_core/features/routing/domain/entities/route_path.dart';
import 'package:sgsd_core/features/routing/domain/repositories/routing_repository.dart';

@LazySingleton(as: RoutingRepository)
class RoutingRepositoryImpl implements RoutingRepository {
  RoutingRepositoryImpl(this._remoteDataSource);

  final OrsRemoteDataSource _remoteDataSource;

  @override
  Future<Either<Failure, RoutePath>> getRoute({
    required GeoPoint start,
    required GeoPoint destination,
  }) async {
    final result = await _remoteDataSource.getRoute(
      start: start,
      destination: destination,
    );

    return switch (result) {
      Left(value: final failure) => Left(failure),
      Right(value: final points) => Right(RoutePath(points: points)),
    };
  }
}
