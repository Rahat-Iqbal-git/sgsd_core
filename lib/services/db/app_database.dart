import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter/foundation.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:sgsd_core/services/db/tables/breadcrumbs_table.dart';
import 'package:sgsd_core/services/db/tables/dispatch_items_table.dart';
import 'package:sgsd_core/services/db/tables/geocode_cache_table.dart';

part 'app_database.g.dart';

@DriftDatabase(tables: [DispatchItems, Breadcrumbs, GeocodeCache])
class AppDatabase extends _$AppDatabase {
  AppDatabase(String keyHex) : super(_open(keyHex));

  @visibleForTesting
  AppDatabase.forTesting(super.e);

  @override
  int get schemaVersion => 1;

  static QueryExecutor _open(String keyHex) {
    return LazyDatabase(() async {
      final dir = await getApplicationDocumentsDirectory();
      final file = File(p.join(dir.path, 'sgsd.db'));

      return NativeDatabase.createInBackground(
        file,
        setup: (db) {
          final cipherVersion = db.select('pragma cipher_version;');
          if (cipherVersion.isEmpty) {
            throw StateError(
              'SQLCipher not available — refusing to open a plaintext '
              'database',
            );
          }

          db
            ..execute("pragma key = \"x'$keyHex'\";")
            ..execute('pragma journal_mode = WAL;');
        },
      );
    });
  }
}
