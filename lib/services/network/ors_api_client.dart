import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:sgsd_core/core/config/environment_config.dart';
import 'package:sgsd_core/services/network/base_dio_client.dart';

@lazySingleton
class OrsApiClient extends BaseDioClient {
  OrsApiClient(Dio dio, EnvironmentConfig config) : super(dio, config) {
    dio.options.baseUrl = config.orsBaseUrl;
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          // ORS takes the raw key, not a Bearer token, unlike GoRest.
          options.headers['Authorization'] = config.orsApiKey;
          handler.next(options);
        },
      ),
    );
  }
}
