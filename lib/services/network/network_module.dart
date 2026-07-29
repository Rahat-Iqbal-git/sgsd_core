import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

// A fresh Dio instance per API client — each client mutates its own
// baseUrl/interceptors in its constructor, so sharing one Dio across
// GoRestApiClient/OrsApiClient/etc. would let them stomp on each other.
@module
abstract class NetworkModule {
  @injectable
  Dio get dio => Dio();
}
