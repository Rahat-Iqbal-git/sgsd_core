import 'package:drift/drift.dart';

@DataClassName('BreadcrumbRow')
class Breadcrumbs extends Table {
  IntColumn get id => integer().autoIncrement()();
  RealColumn get lat => real()();
  RealColumn get lng => real()();
  RealColumn get speed => real()();
  RealColumn get accuracy => real()();
  DateTimeColumn get recordedAt => dateTime()();
  TextColumn get addressLabel => text().nullable()();
  BoolColumn get synced => boolean().withDefault(const Constant(false))();
  IntColumn get attempts => integer().withDefault(const Constant(0))();
  DateTimeColumn get nextAttemptAt => dateTime().nullable()();
}
