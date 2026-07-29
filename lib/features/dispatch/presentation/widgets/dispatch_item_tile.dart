import 'package:flutter/material.dart';
import 'package:sgsd_core/features/dispatch/domain/entities/delivery_status.dart';
import 'package:sgsd_core/features/dispatch/domain/entities/dispatch_item.dart';

class DispatchItemTile extends StatelessWidget {
  const DispatchItemTile({required this.item, super.key});

  final DispatchItem item;

  @override
  Widget build(BuildContext context) {
    final initial = item.recipientName.isNotEmpty
        ? item.recipientName[0].toUpperCase()
        : '?';

    return Semantics(
      label: '${item.recipientName}, delivery ${_statusLabel(item.status)}',
      child: ListTile(
        leading: CircleAvatar(child: Text(initial)),
        title: Text(item.recipientName),
        subtitle: Text(item.recipientEmail),
        trailing: _StatusBadge(status: item.status),
      ),
    );
  }
}

class _StatusBadge extends StatelessWidget {
  const _StatusBadge({required this.status});

  final DeliveryStatus status;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final (background, foreground) = switch (status) {
      DeliveryStatus.pending => (
        colorScheme.surfaceContainerHighest,
        colorScheme.onSurfaceVariant,
      ),
      DeliveryStatus.inProgress => (
        colorScheme.primaryContainer,
        colorScheme.onPrimaryContainer,
      ),
      DeliveryStatus.delivered => (
        colorScheme.tertiaryContainer,
        colorScheme.onTertiaryContainer,
      ),
    };

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        _statusLabel(status),
        style: Theme.of(
          context,
        ).textTheme.labelSmall?.copyWith(color: foreground),
      ),
    );
  }
}

String _statusLabel(DeliveryStatus status) {
  return switch (status) {
    DeliveryStatus.pending => 'Pending',
    DeliveryStatus.inProgress => 'In progress',
    DeliveryStatus.delivered => 'Delivered',
  };
}
