// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i558;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:sgsd_core/core/config/environment_config.dart' as _i642;
import 'package:sgsd_core/services/db/app_database.dart' as _i298;
import 'package:sgsd_core/services/db/db_module.dart' as _i479;
import 'package:sgsd_core/services/db/key/database_key_provider.dart' as _i950;
import 'package:sgsd_core/services/network/gorest_api_client.dart' as _i707;
import 'package:sgsd_core/services/network/network_module.dart' as _i330;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final networkModule = _$NetworkModule();
    final dbModule = _$DbModule();
    gh.factory<_i361.Dio>(() => networkModule.dio);
    gh.lazySingleton<_i558.FlutterSecureStorage>(() => dbModule.secureStorage);
    gh.lazySingleton<_i707.GoRestApiClient>(
      () =>
          _i707.GoRestApiClient(gh<_i361.Dio>(), gh<_i642.EnvironmentConfig>()),
    );
    gh.lazySingleton<_i950.DatabaseKeyProvider>(
      () => _i950.DatabaseKeyProvider(gh<_i558.FlutterSecureStorage>()),
    );
    await gh.lazySingletonAsync<_i298.AppDatabase>(
      () => dbModule.appDatabase(gh<_i950.DatabaseKeyProvider>()),
      preResolve: true,
    );
    return this;
  }
}

class _$NetworkModule extends _i330.NetworkModule {}

class _$DbModule extends _i479.DbModule {}
