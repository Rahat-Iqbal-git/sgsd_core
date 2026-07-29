import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:sgsd_core/core/error/failure.dart';
import 'package:sgsd_core/features/dispatch/domain/repositories/dispatch_repository.dart';

@injectable
class RefreshDispatchItems {
  const RefreshDispatchItems(this._repository);

  final DispatchRepository _repository;

  Future<Either<Failure, Unit>> call() => _repository.refreshDispatchItems();
}
