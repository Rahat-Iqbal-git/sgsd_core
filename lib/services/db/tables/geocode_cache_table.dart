import 'package:drift/drift.dart';

@DataClassName('GeocodeCacheRow')
class GeocodeCache extends Table {
  RealColumn get latRounded => real()();
  RealColumn get lngRounded => real()();
  TextColumn get address => text()();
  DateTimeColumn get fetchedAt => dateTime()();

  @override
  Set<Column> get primaryKey => {latRounded, lngRounded};
}
