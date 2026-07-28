import 'package:sgsd_core/features/dispatch/domain/entities/dispatch_item.dart';
import 'package:sgsd_core/features/dispatch/domain/repositories/dispatch_repository.dart';

class WatchDispatchItems {
  const WatchDispatchItems(this._repository);

  final DispatchRepository _repository;

  Stream<List<DispatchItem>> call() => _repository.watchDispatchItems();
}
