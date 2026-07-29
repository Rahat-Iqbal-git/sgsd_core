import 'package:drift/drift.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:sgsd_core/core/geo/geo_point.dart';
import 'package:sgsd_core/services/db/app_database.dart';
import 'package:sgsd_core/services/network/nominatim_api_client.dart';

@lazySingleton
class ReverseGeocoder {
  ReverseGeocoder(this._apiClient, this._database);

  final NominatimApiClient _apiClient;
  final AppDatabase _database;

  DateTime? _lastRequestAt;

  Future<String?> addressFor(GeoPoint point) async {
    final latRounded = _round(point.latitude);
    final lngRounded = _round(point.longitude);

    final cached =
        await (_database.select(_database.geocodeCache)..where(
              (t) =>
                  t.latRounded.equals(latRounded) &
                  t.lngRounded.equals(lngRounded),
            ))
            .getSingleOrNull();
    if (cached != null) {
      return cached.address;
    }

    await _throttle();

    final response = await _apiClient.get<Map<String, dynamic>>(
      '/reverse',
      queryParameters: {
        'lat': latRounded,
        'lon': lngRounded,
        'format': 'jsonv2',
        'accept-language': 'en',
      },
    );

    return switch (response) {
      Left() => null,
      Right(value: final json) => _handleResponse(
        json,
        latRounded,
        lngRounded,
      ),
    };
  }

  Future<String?> _handleResponse(
    Map<String, dynamic> json,
    double latRounded,
    double lngRounded,
  ) async {
    final address = json['display_name'];
    if (address is! String) {
      return null;
    }

    await _database
        .into(_database.geocodeCache)
        .insert(
          GeocodeCacheCompanion.insert(
            latRounded: latRounded,
            lngRounded: lngRounded,
            address: address,
            fetchedAt: DateTime.now(),
          ),
          onConflict: DoNothing(),
        );

    return address;
  }

  Future<void> _throttle() async {
    final lastRequestAt = _lastRequestAt;
    if (lastRequestAt != null) {
      final elapsed = DateTime.now().difference(lastRequestAt);
      const minInterval = Duration(seconds: 1);
      if (elapsed < minInterval) {
        await Future<void>.delayed(minInterval - elapsed);
      }
    }
    _lastRequestAt = DateTime.now();
  }

  double _round(double value) => (value * 10000).round() / 10000;
}
