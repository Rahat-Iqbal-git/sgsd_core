import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:sgsd_core/core/config/environment_config.dart';
import 'package:sgsd_core/services/network/base_dio_client.dart';

@lazySingleton
class NominatimApiClient extends BaseDioClient {
  NominatimApiClient(Dio dio, EnvironmentConfig config) : super(dio, config) {
    dio.options.baseUrl = 'https://nominatim.openstreetmap.org';
    dio.options.headers['User-Agent'] =
        'SGSD-Core/1.0 (field dispatch assessment app)';
  }
}
