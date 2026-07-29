import 'package:equatable/equatable.dart';
import 'package:sgsd_core/core/geo/geo_point.dart';

class RoutePath extends Equatable {
  const RoutePath({required this.points});

  final List<GeoPoint> points;

  @override
  List<Object?> get props => [points];
}
