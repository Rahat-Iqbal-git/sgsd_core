import 'package:equatable/equatable.dart';
import 'package:sgsd_core/core/geo/geo_point.dart';
import 'package:sgsd_core/features/dispatch/domain/entities/delivery_status.dart';

class DispatchItem extends Equatable {
  const DispatchItem({
    required this.id,
    required this.recipientName,
    required this.recipientEmail,
    required this.destination,
    required this.status,
  });

  final int id;
  final String recipientName;
  final String recipientEmail;
  final GeoPoint destination;
  final DeliveryStatus status;

  @override
  List<Object?> get props => [
    id,
    recipientName,
    recipientEmail,
    destination,
    status,
  ];
}
