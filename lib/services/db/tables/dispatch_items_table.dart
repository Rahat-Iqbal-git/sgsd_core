import 'package:drift/drift.dart';

@DataClassName('DispatchItemRow')
class DispatchItems extends Table {
  IntColumn get id => integer()();
  TextColumn get recipientName => text()();
  TextColumn get recipientEmail => text()();
  TextColumn get remoteStatus => text()();
  RealColumn get destLat => real()();
  RealColumn get destLng => real()();
  TextColumn get localStatus => text().withDefault(const Constant('pending'))();
  DateTimeColumn get updatedAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}
