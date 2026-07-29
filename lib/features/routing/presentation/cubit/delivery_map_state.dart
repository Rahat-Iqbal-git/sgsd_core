import 'package:equatable/equatable.dart';
import 'package:sgsd_core/core/error/failure.dart';
import 'package:sgsd_core/core/geo/geo_point.dart';
import 'package:sgsd_core/features/routing/domain/entities/route_path.dart';

const _unset = Object();

class DeliveryMapState extends Equatable {
  const DeliveryMapState({
    this.route,
    this.addressLabel,
    this.agentPosition,
    this.isLoading = true,
    this.failure,
  });

  final RoutePath? route;
  final String? addressLabel;
  final GeoPoint? agentPosition;
  final bool isLoading;
  final Failure? failure;

  DeliveryMapState copyWith({
    Object? route = _unset,
    Object? addressLabel = _unset,
    Object? agentPosition = _unset,
    bool? isLoading,
    Object? failure = _unset,
  }) {
    return DeliveryMapState(
      route: identical(route, _unset) ? this.route : route as RoutePath?,
      addressLabel: identical(addressLabel, _unset)
          ? this.addressLabel
          : addressLabel as String?,
      agentPosition: identical(agentPosition, _unset)
          ? this.agentPosition
          : agentPosition as GeoPoint?,
      isLoading: isLoading ?? this.isLoading,
      failure: identical(failure, _unset) ? this.failure : failure as Failure?,
    );
  }

  @override
  List<Object?> get props => [
    route,
    addressLabel,
    agentPosition,
    isLoading,
    failure,
  ];
}
