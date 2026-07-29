import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sgsd_core/core/di/injection.dart';
import 'package:sgsd_core/core/geo/geo_point.dart';
import 'package:sgsd_core/features/dispatch/domain/entities/dispatch_item.dart';
import 'package:sgsd_core/features/routing/domain/entities/route_path.dart';
import 'package:sgsd_core/features/routing/presentation/cubit/delivery_map_cubit.dart';
import 'package:sgsd_core/features/routing/presentation/cubit/delivery_map_state.dart';
import 'package:webview_flutter/webview_flutter.dart';

class DeliveryMapPage extends StatelessWidget {
  const DeliveryMapPage({required this.item, super.key});

  final DispatchItem item;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) {
        final cubit = getIt<DeliveryMapCubit>();
        unawaited(cubit.load(item.destination));
        return cubit;
      },
      child: DeliveryMapView(item: item),
    );
  }
}

class DeliveryMapView extends StatefulWidget {
  const DeliveryMapView({required this.item, super.key});

  final DispatchItem item;

  @override
  State<DeliveryMapView> createState() => _DeliveryMapViewState();
}

class _DeliveryMapViewState extends State<DeliveryMapView> {
  late final WebViewController _controller;
  var _ready = false;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController();
    unawaited(_setUpController());
  }

  Future<void> _setUpController() async {
    await _controller.setJavaScriptMode(JavaScriptMode.unrestricted);
    await _controller.addJavaScriptChannel(
      'MapChannel',
      onMessageReceived: _onMapMessage,
    );
    await _controller.loadFlutterAsset('assets/map/map.html');
  }

  void _onMapMessage(JavaScriptMessage message) {
    if (message.message != 'ready') {
      return;
    }

    setState(() => _ready = true);

    final destination = widget.item.destination;
    unawaited(
      _controller.runJavaScript(
        'window.setDestination(${destination.latitude}, '
        '${destination.longitude})',
      ),
    );

    final state = context.read<DeliveryMapCubit>().state;
    final route = state.route;
    if (route != null) {
      unawaited(_pushRoute(route));
    }

    final agentPosition = state.agentPosition;
    if (agentPosition != null) {
      unawaited(_pushAgent(agentPosition));
    }
  }

  Future<void> _pushRoute(RoutePath route) {
    final coords = [
      for (final point in route.points) [point.latitude, point.longitude],
    ];
    final escaped = jsonEncode(
      coords,
    ).replaceAll(r'\', r'\\').replaceAll("'", r"\'");
    return _controller.runJavaScript("window.setRoute('$escaped')");
  }

  Future<void> _pushAgent(GeoPoint position) {
    return _controller.runJavaScript(
      'window.updateAgent(${position.latitude}, ${position.longitude})',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.item.recipientName)),
      body: BlocConsumer<DeliveryMapCubit, DeliveryMapState>(
        listenWhen: (previous, current) =>
            previous.route != current.route ||
            previous.agentPosition != current.agentPosition ||
            previous.failure != current.failure,
        listener: (context, state) {
          final failure = state.failure;
          if (failure != null) {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(SnackBar(content: Text(failure.message)));
          }

          if (!_ready) {
            return;
          }

          final route = state.route;
          if (route != null) {
            unawaited(_pushRoute(route));
          }

          final agentPosition = state.agentPosition;
          if (agentPosition != null) {
            unawaited(_pushAgent(agentPosition));
          }
        },
        builder: (context, state) {
          return Column(
            children: [
              Expanded(
                child: RepaintBoundary(
                  child: Semantics(
                    label: 'Delivery route map',
                    child: WebViewWidget(controller: _controller),
                  ),
                ),
              ),
              if (state.addressLabel != null)
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Text(state.addressLabel!),
                ),
            ],
          );
        },
      ),
    );
  }
}
