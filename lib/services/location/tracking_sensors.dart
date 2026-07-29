import 'package:sgsd_core/services/location/breadcrumb.dart';
import 'package:sgsd_core/services/location/tracking_band.dart';

abstract interface class TrackingSensors {
  Future<bool> ensurePermission();
  Stream<Breadcrumb> positions(TrackingBand band);
  Stream<void> motion();
}
