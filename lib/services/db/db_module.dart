import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:sgsd_core/services/db/app_database.dart';
import 'package:sgsd_core/services/db/key/database_key_provider.dart';

@module
abstract class DbModule {
  @lazySingleton
  FlutterSecureStorage get secureStorage => const FlutterSecureStorage();

  //

  @preResolve
  @lazySingleton
  Future<AppDatabase> appDatabase(DatabaseKeyProvider keyProvider) async =>
      AppDatabase(await keyProvider.databaseKey());
}
