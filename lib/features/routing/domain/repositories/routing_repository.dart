import 'package:fpdart/fpdart.dart';
import 'package:sgsd_core/core/error/failure.dart';
import 'package:sgsd_core/core/geo/geo_point.dart';
import 'package:sgsd_core/features/routing/domain/entities/route_path.dart';

// Single-method contract by design, matching the repository pattern used
// throughout this codebase.
// ignore: one_member_abstracts
abstract interface class RoutingRepository {
  Future<Either<Failure, RoutePath>> getRoute({
    required GeoPoint start,
    required GeoPoint destination,
  });
}
