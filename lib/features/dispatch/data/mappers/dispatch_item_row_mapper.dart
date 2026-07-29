import 'package:sgsd_core/core/geo/geo_point.dart';
import 'package:sgsd_core/features/dispatch/domain/entities/delivery_status.dart';
import 'package:sgsd_core/features/dispatch/domain/entities/dispatch_item.dart';
import 'package:sgsd_core/services/db/app_database.dart';

extension DispatchItemRowMapper on DispatchItemRow {
  DispatchItem toEntity() {
    return DispatchItem(
      id: id,
      recipientName: recipientName,
      recipientEmail: recipientEmail,
      destination: GeoPoint(latitude: destLat, longitude: destLng),
      status: DeliveryStatus.values.byName(localStatus),
    );
  }
}
