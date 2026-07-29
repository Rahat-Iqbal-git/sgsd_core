import 'package:flutter/foundation.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:sgsd_core/core/error/failure.dart';
import 'package:sgsd_core/core/geo/geo_point.dart';
import 'package:sgsd_core/services/network/ors_api_client.dart';

@lazySingleton
class OrsRemoteDataSource {
  OrsRemoteDataSource(this._apiClient);

  final OrsApiClient _apiClient;

  Future<Either<Failure, List<GeoPoint>>> getRoute({
    required GeoPoint start,
    required GeoPoint destination,
  }) async {
    final response = await _apiClient.post<Map<String, dynamic>>(
      '/v2/directions/driving-car/geojson',
      data: {
        // GeoJSON is [longitude, latitude] — the reverse of GeoPoint's
        // field order.
        'coordinates': [
          [start.longitude, start.latitude],
          [destination.longitude, destination.latitude],
        ],
      },
    );

    return switch (response) {
      Left(value: final failure) => Left(failure),
      Right(value: final json) => _parseCoordinates(json),
    };
  }

  Future<Either<Failure, List<GeoPoint>>> _parseCoordinates(
    Map<String, dynamic> json,
  ) async {
    try {
      final features = json['features'] as List<dynamic>;
      final geometry = features[0] as Map<String, dynamic>;
      final coordinates =
          (geometry['geometry'] as Map<String, dynamic>)['coordinates']
              as List<dynamic>;
      final points = await compute(_coordinatesToGeoPoints, coordinates);
      return Right(points);
    } on Object catch (e) {
      return Left(UnknownFailure('Failed to parse ORS response: $e'));
    }
  }
}

List<GeoPoint> _coordinatesToGeoPoints(List<dynamic> coordinates) {
  return coordinates.map((e) {
    final pair = e as List<dynamic>;
    return GeoPoint(
      latitude: (pair[1] as num).toDouble(),
      longitude: (pair[0] as num).toDouble(),
    );
  }).toList();
}
