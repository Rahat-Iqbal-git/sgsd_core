import 'package:sgsd_core/core/geo/geo_point.dart';

// mock delivery points around Dhaka
const _destinations = <GeoPoint>[
  GeoPoint(latitude: 23.810331, longitude: 90.412521),
  GeoPoint(latitude: 23.780812, longitude: 90.279234),
  GeoPoint(latitude: 23.7461, longitude: 90.3742),
  GeoPoint(latitude: 23.79251, longitude: 90.40781),
  GeoPoint(latitude: 23.875943, longitude: 90.379512),
  GeoPoint(latitude: 23.7104, longitude: 90.40739),
  GeoPoint(latitude: 23.804122, longitude: 90.364378),
  GeoPoint(latitude: 23.75931, longitude: 90.3788),
  GeoPoint(latitude: 23.730712, longitude: 90.412598),
  GeoPoint(latitude: 23.8433, longitude: 90.267),
  GeoPoint(latitude: 23.797, longitude: 90.449412),
  GeoPoint(latitude: 23.68502, longitude: 90.465031),
  GeoPoint(latitude: 23.90881, longitude: 90.366721),
  GeoPoint(latitude: 23.7639, longitude: 90.33),
  GeoPoint(latitude: 23.82134, longitude: 90.36542),
  GeoPoint(latitude: 23.70012, longitude: 90.38331),
  GeoPoint(latitude: 23.7488, longitude: 90.42891),
  GeoPoint(latitude: 23.79634, longitude: 90.41823),
  GeoPoint(latitude: 23.71553, longitude: 90.39812),
  GeoPoint(latitude: 23.84721, longitude: 90.34198),
];

GeoPoint destinationForUserId(int userId) {
  return _destinations[userId % _destinations.length];
}
