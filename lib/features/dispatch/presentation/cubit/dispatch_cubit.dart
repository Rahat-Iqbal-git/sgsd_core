import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:sgsd_core/features/dispatch/domain/entities/dispatch_item.dart';
import 'package:sgsd_core/features/dispatch/domain/usecases/refresh_dispatch_items.dart';
import 'package:sgsd_core/features/dispatch/domain/usecases/watch_dispatch_items.dart';
import 'package:sgsd_core/features/dispatch/presentation/cubit/dispatch_state.dart';

@injectable
class DispatchCubit extends Cubit<DispatchState> {
  DispatchCubit(this._watchDispatchItems, this._refreshDispatchItems)
    : super(const DispatchState()) {
    _subscription = _watchDispatchItems().listen(_onItemsChanged);
    unawaited(refresh());
  }

  final WatchDispatchItems _watchDispatchItems;
  final RefreshDispatchItems _refreshDispatchItems;
  late final StreamSubscription<List<DispatchItem>> _subscription;

  void _onItemsChanged(List<DispatchItem> items) {
    emit(state.copyWith(items: items, isLoading: false));
  }

  Future<void> refresh() async {
    emit(state.copyWith(isRefreshing: true, refreshError: null));

    final result = await _refreshDispatchItems();
    switch (result) {
      case Left(value: final failure):
        emit(state.copyWith(isRefreshing: false, refreshError: failure));
      case Right():
        emit(state.copyWith(isRefreshing: false));
    }
  }

  @override
  Future<void> close() {
    unawaited(_subscription.cancel());
    return super.close();
  }
}
