import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sgsd_core/features/tracking/presentation/cubit/tracking_cubit.dart';
import 'package:sgsd_core/services/location/tracking_engine.dart';

class TrackingToggle extends StatelessWidget {
  const TrackingToggle({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TrackingCubit, TrackingStatus>(
      builder: (context, status) {
        return IconButton(
          icon: Icon(_iconFor(status)),
          tooltip: _tooltipFor(status),
          onPressed: () async {
            final started = await context.read<TrackingCubit>().toggle();
            if (!started && context.mounted) {
              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(
                  const SnackBar(content: Text('Location permission required')),
                );
            }
          },
        );
      },
    );
  }

  IconData _iconFor(TrackingStatus status) => switch (status) {
    TrackingStatus.stopped => Icons.location_disabled,
    TrackingStatus.stationary => Icons.location_searching,
    TrackingStatus.moving => Icons.my_location,
  };

  String _tooltipFor(TrackingStatus status) => switch (status) {
    TrackingStatus.stopped => 'Start tracking',
    TrackingStatus.stationary => 'Tracking: stationary',
    TrackingStatus.moving => 'Tracking: moving',
  };
}
