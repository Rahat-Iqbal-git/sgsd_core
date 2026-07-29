import 'package:equatable/equatable.dart';
import 'package:sgsd_core/core/geo/geo_point.dart';

class Breadcrumb extends Equatable {
  const Breadcrumb({
    required this.position,
    required this.speedMps,
    required this.accuracyM,
    required this.recordedAt,
  });

  final GeoPoint position;
  final double speedMps;
  final double accuracyM;
  final DateTime recordedAt;

  @override
  List<Object?> get props => [position, speedMps, accuracyM, recordedAt];
}
