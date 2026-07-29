import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:sgsd_core/core/config/environment_config.dart';
import 'package:sgsd_core/core/error/failure.dart';

abstract class BaseDioClient {
  BaseDioClient(this._dio, this._config) {
    _dio
      ..options.connectTimeout = const Duration(seconds: 15)
      ..options.receiveTimeout = const Duration(seconds: 15)
      ..options.responseType = ResponseType.json
      // Add LogInterceptor only when the flavor enables it
      ..interceptors.addAll([
        if (_config.enableLogging)
          LogInterceptor(requestBody: true, responseBody: true),
      ]);
  }

  final Dio _dio;
  final EnvironmentConfig _config;

  Future<Either<Failure, T>> _performRequest<T>(
    Future<Response<T>> Function() request,
  ) async {
    try {
      final response = await request();
      final data = response.data;
      if (data == null) {
        return Left(
          ServerFailure('Empty response body', statusCode: response.statusCode),
        );
      }
      return Right(data as T);
    } on DioException catch (e) {
      log(e.toString(), name: 'DioException');
      return Left(_mapDioException(e));
    } on Object catch (e) {
      return Left(UnknownFailure('Unexpected error: $e'));
    }
  }

  Future<Either<Failure, T>> get<T>(
    String url, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    return _performRequest<T>(
      () => _dio.get<T>(
        url,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      ),
    );
  }

  Future<Either<Failure, T>> post<T>(
    String url, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    return _performRequest<T>(
      () => _dio.post<T>(
        url,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      ),
    );
  }

  Failure _mapDioException(DioException exception) {
    final statusCode = exception.response?.statusCode;

    if (statusCode == 401 || statusCode == 403) {
      return AuthFailure(_extractMessage(exception));
    }

    switch (exception.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.transformTimeout:
      case DioExceptionType.connectionError:
        return const NetworkFailure();
      case DioExceptionType.badResponse:
        return ServerFailure(
          _extractMessage(exception),
          statusCode: statusCode,
        );
      case DioExceptionType.cancel:
      case DioExceptionType.badCertificate:
      case DioExceptionType.unknown:
        return UnknownFailure(_extractMessage(exception));
    }
  }

  String _extractMessage(DioException exception) {
    final data = exception.response?.data;
    if (data is Map<String, dynamic> && data['message'] is String) {
      return data['message'] as String;
    }
    return exception.message ?? 'Network request failed';
  }
}
