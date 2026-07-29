import 'package:equatable/equatable.dart';
import 'package:sgsd_core/core/error/failure.dart';
import 'package:sgsd_core/features/dispatch/domain/entities/dispatch_item.dart';

const _unset = Object();

class DispatchState extends Equatable {
  const DispatchState({
    this.items = const <DispatchItem>[],
    this.isLoading = true,
    this.isRefreshing = false,
    this.refreshError,
  });

  final List<DispatchItem> items;
  final bool isLoading;
  final bool isRefreshing;
  final Failure? refreshError;

  DispatchState copyWith({
    List<DispatchItem>? items,
    bool? isLoading,
    bool? isRefreshing,
    Object? refreshError = _unset,
  }) {
    return DispatchState(
      items: items ?? this.items,
      isLoading: isLoading ?? this.isLoading,
      isRefreshing: isRefreshing ?? this.isRefreshing,
      refreshError: identical(refreshError, _unset)
          ? this.refreshError
          : refreshError as Failure?,
    );
  }

  @override
  List<Object?> get props => [items, isLoading, isRefreshing, refreshError];
}
