import 'package:sgsd_core/core/config/environment.dart';
import 'package:sgsd_core/core/config/environment_config.dart';

class EnvironmentFactory {
  static EnvironmentConfig create(Environment env) {
    switch (env) {
      case Environment.development:
        return _DevelopmentConfig();
      case Environment.staging:
        return _StagingConfig();
      case Environment.production:
        return _ProductionConfig();
    }
  }
}

class _DevelopmentConfig implements EnvironmentConfig {
  @override
  Environment get environment => Environment.development;

  @override
  String get appName => const String.fromEnvironment(
    'APP_NAME',
    defaultValue: '[DEV] Sgsd Core',
  );

  @override
  bool get enableLogging =>
      const bool.fromEnvironment('ENABLE_LOGGING', defaultValue: true);

  @override
  String get goRestToken => const String.fromEnvironment(
    'GOREST_TOKEN',
    defaultValue: 'demo-token',
  );

  // No default , fail loudly with 401 from ors
  @override
  String get orsApiKey => const String.fromEnvironment('ORS_API_KEY');

  @override
  String get goRestBaseUrl => const String.fromEnvironment(
    'GOREST_BASE_URL',
    defaultValue: 'https://gorest.in/public/v2',
  );

  @override
  String get orsBaseUrl => const String.fromEnvironment(
    'ORS_BASE_URL',
    defaultValue: 'https://api.openrouteservice.org',
  );
}

class _StagingConfig implements EnvironmentConfig {
  @override
  Environment get environment => Environment.staging;

  @override
  String get appName => const String.fromEnvironment(
    'APP_NAME',
    defaultValue: '[STG] Sgsd Core',
  );

  @override
  bool get enableLogging =>
      const bool.fromEnvironment('ENABLE_LOGGING', defaultValue: true);

  @override
  String get goRestToken => const String.fromEnvironment(
    'GOREST_TOKEN',
    defaultValue: 'demo-token',
  );

  @override
  String get orsApiKey => const String.fromEnvironment('ORS_API_KEY');

  @override
  String get goRestBaseUrl => const String.fromEnvironment(
    'GOREST_BASE_URL',
    defaultValue: 'https://gorest.in/public/v2',
  );

  @override
  String get orsBaseUrl => const String.fromEnvironment(
    'ORS_BASE_URL',
    defaultValue: 'https://api.openrouteservice.org',
  );
}

class _ProductionConfig implements EnvironmentConfig {
  @override
  Environment get environment => Environment.production;

  @override
  String get appName =>
      const String.fromEnvironment('APP_NAME', defaultValue: 'Sgsd Core');

  @override
  bool get enableLogging => false;

  @override
  String get goRestToken => const String.fromEnvironment(
    'GOREST_TOKEN',
    defaultValue: 'demo-token',
  );

  @override
  String get orsApiKey => const String.fromEnvironment('ORS_API_KEY');

  @override
  String get goRestBaseUrl => const String.fromEnvironment(
    'GOREST_BASE_URL',
    defaultValue: 'https://gorest.in/public/v2',
  );

  @override
  String get orsBaseUrl => const String.fromEnvironment(
    'ORS_BASE_URL',
    defaultValue: 'https://api.openrouteservice.org',
  );
}
