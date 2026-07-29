import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sgsd_core/core/di/injection.dart';
import 'package:sgsd_core/features/dispatch/presentation/cubit/dispatch_cubit.dart';
import 'package:sgsd_core/features/dispatch/presentation/cubit/dispatch_state.dart';
import 'package:sgsd_core/features/dispatch/presentation/widgets/dispatch_item_tile.dart';
import 'package:sgsd_core/features/tracking/presentation/cubit/tracking_cubit.dart';
import 'package:sgsd_core/features/tracking/presentation/widgets/tracking_toggle.dart';

class DispatchListPage extends StatelessWidget {
  const DispatchListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => getIt<DispatchCubit>()),
        BlocProvider(create: (_) => getIt<TrackingCubit>()),
      ],
      child: const DispatchView(),
    );
  }
}

class DispatchView extends StatelessWidget {
  const DispatchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dispatch'),
        actions: const [TrackingToggle()],
      ),
      body: BlocConsumer<DispatchCubit, DispatchState>(
        listener: (context, state) {
          final error = state.refreshError;
          if (error != null) {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                SnackBar(content: Text('Refresh failed: ${error.message}')),
              );
          }
        },
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(
              child: CircularProgressIndicator(
                semanticsLabel: 'Loading deliveries',
              ),
            );
          }

          final cubit = context.read<DispatchCubit>();

          if (state.items.isEmpty) {
            return RefreshIndicator(
              onRefresh: cubit.refresh,
              child: ListView(
                physics: const AlwaysScrollableScrollPhysics(),
                children: const [
                  SizedBox(height: 120),
                  Center(child: Text('No deliveries yet')),
                ],
              ),
            );
          }

          return RefreshIndicator(
            onRefresh: cubit.refresh,
            child: ListView.builder(
              physics: const AlwaysScrollableScrollPhysics(),
              itemCount: state.items.length,
              itemBuilder: (context, index) {
                final item = state.items[index];
                return DispatchItemTile(key: ValueKey(item.id), item: item);
              },
            ),
          );
        },
      ),
    );
  }
}
