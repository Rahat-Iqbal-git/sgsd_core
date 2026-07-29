import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:sgsd_core/core/error/failure.dart';
import 'package:sgsd_core/core/geo/geo_point.dart';
import 'package:sgsd_core/features/routing/domain/repositories/routing_repository.dart';
import 'package:sgsd_core/features/routing/presentation/cubit/delivery_map_state.dart';
import 'package:sgsd_core/services/geocoding/reverse_geocoder.dart';
import 'package:sgsd_core/services/location/breadcrumb.dart';
import 'package:sgsd_core/services/location/tracking_engine.dart';
import 'package:sgsd_core/services/location/tracking_sensors.dart';

@injectable
class DeliveryMapCubit extends Cubit<DeliveryMapState> {
  DeliveryMapCubit(
    this._routingRepository,
    this._reverseGeocoder,
    this._trackingSensors,
    this._trackingEngine,
  ) : super(const DeliveryMapState()) {
    _subscription = _trackingEngine.breadcrumbs.listen(_onBreadcrumb);
  }

  final RoutingRepository _routingRepository;
  final ReverseGeocoder _reverseGeocoder;
  final TrackingSensors _trackingSensors;
  final TrackingEngine _trackingEngine;
  late final StreamSubscription<Breadcrumb> _subscription;

  Future<void> load(GeoPoint destination) async {
    final start = await _trackingSensors.currentPosition();
    if (start == null) {
      emit(
        state.copyWith(
          isLoading: false,
          failure: const ValidationFailure('Location unavailable'),
        ),
      );
      return;
    }

    emit(state.copyWith(agentPosition: start));

    final routeResult = await _routingRepository.getRoute(
      start: start,
      destination: destination,
    );
    switch (routeResult) {
      case Left(value: final failure):
        emit(state.copyWith(isLoading: false, failure: failure));
      case Right(value: final route):
        emit(state.copyWith(isLoading: false, route: route, failure: null));
    }

    final address = await _reverseGeocoder.addressFor(destination);
    if (address != null) {
      emit(state.copyWith(addressLabel: address));
    }
  }

  void _onBreadcrumb(Breadcrumb breadcrumb) {
    emit(state.copyWith(agentPosition: breadcrumb.position));
  }

  @override
  Future<void> close() {
    unawaited(_subscription.cancel());
    return super.close();
  }
}
