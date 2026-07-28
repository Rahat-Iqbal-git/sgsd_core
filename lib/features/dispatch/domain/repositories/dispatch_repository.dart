import 'package:fpdart/fpdart.dart';
import 'package:sgsd_core/core/error/failure.dart';
import 'package:sgsd_core/features/dispatch/domain/entities/dispatch_item.dart';

abstract interface class DispatchRepository {
  Stream<List<DispatchItem>> watchDispatchItems();

  Future<Either<Failure, Unit>> refreshDispatchItems();
}
