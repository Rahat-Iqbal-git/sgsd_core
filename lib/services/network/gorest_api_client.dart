import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:sgsd_core/core/config/environment_config.dart';
import 'package:sgsd_core/services/network/base_dio_client.dart';

@lazySingleton
class GoRestApiClient extends BaseDioClient {
  GoRestApiClient(Dio dio, EnvironmentConfig config) : super(dio, config) {
    dio.options.baseUrl = config.goRestBaseUrl;
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          options.headers['Authorization'] = 'Bearer ${config.goRestToken}';
          handler.next(options);
        },
      ),
    );
  }
}
