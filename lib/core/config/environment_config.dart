import 'package:sgsd_core/core/config/environment.dart';

abstract interface class EnvironmentConfig {
  Environment get environment;
  String get appName;
  bool get enableLogging;
  String get goRestToken;
  String get orsApiKey;
  String get goRestBaseUrl;
  String get orsBaseUrl;
}
