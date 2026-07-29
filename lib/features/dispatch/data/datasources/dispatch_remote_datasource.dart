import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:sgsd_core/core/error/failure.dart';
import 'package:sgsd_core/features/dispatch/data/dtos/user_dto.dart';
import 'package:sgsd_core/services/network/gorest_api_client.dart';

@lazySingleton
class DispatchRemoteDataSource {
  DispatchRemoteDataSource(this._apiClient);

  final GoRestApiClient _apiClient;

  Future<Either<Failure, List<UserDto>>> getUsers() async {
    final response = await _apiClient.get<List<dynamic>>(
      '/users',
      queryParameters: const {'per_page': 20},
    );

    return response.flatMap(_parseUsers);
  }

  Either<Failure, List<UserDto>> _parseUsers(List<dynamic> json) {
    try {
      final users = json
          .map((e) => UserDto.fromJson(e as Map<String, dynamic>))
          .toList();
      return Right(users);
    } on Object catch (e) {
      return Left(UnknownFailure('Failed to parse GoRest response: $e'));
    }
  }
}
