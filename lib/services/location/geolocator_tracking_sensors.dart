import 'dart:io';

import 'package:geolocator/geolocator.dart';
import 'package:injectable/injectable.dart';
import 'package:sensors_plus/sensors_plus.dart';
import 'package:sgsd_core/core/geo/geo_point.dart';
import 'package:sgsd_core/services/location/breadcrumb.dart';
import 'package:sgsd_core/services/location/motion_detector.dart';
import 'package:sgsd_core/services/location/tracking_band.dart';
import 'package:sgsd_core/services/location/tracking_sensors.dart';

@LazySingleton(as: TrackingSensors)
class GeolocatorTrackingSensors implements TrackingSensors {
  @override
  Future<bool> ensurePermission() async {
    if (!await Geolocator.isLocationServiceEnabled()) {
      return false;
    }

    var permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    return permission == LocationPermission.always ||
        permission == LocationPermission.whileInUse;
  }

  @override
  Stream<Breadcrumb> positions(TrackingBand band) {
    return Geolocator.getPositionStream(
      locationSettings: _settingsFor(band),
    ).map(
      (p) => Breadcrumb(
        position: GeoPoint(latitude: p.latitude, longitude: p.longitude),
        speedMps: p.speed,
        accuracyM: p.accuracy,
        recordedAt: p.timestamp,
      ),
    );
  }

  LocationSettings _settingsFor(TrackingBand band) {
    if (Platform.isIOS) {
      return AppleSettings(
        accuracy: LocationAccuracy.high,
        activityType: ActivityType.automotiveNavigation,
        pauseLocationUpdatesAutomatically: true,
        showBackgroundLocationIndicator: true,
      );
    }

    return AndroidSettings(
      accuracy: LocationAccuracy.high,
      intervalDuration: band.interval,
      foregroundNotificationConfig: const ForegroundNotificationConfig(
        notificationTitle: 'Tracking active',
        notificationText: 'Recording your delivery route',
        enableWakeLock: true,
      ),
    );
  }

  @override
  Stream<void> motion() {
    return userAccelerometerEventStream().where(isMoving).map((_) {});
  }

  @override
  Future<GeoPoint?> currentPosition() async {
    if (!await ensurePermission()) {
      return null;
    }

    try {
      final position = await Geolocator.getCurrentPosition(
        locationSettings: const LocationSettings(
          accuracy: LocationAccuracy.high,
        ),
      );
      return GeoPoint(
        latitude: position.latitude,
        longitude: position.longitude,
      );
    } on Exception {
      return null;
    }
  }
}
