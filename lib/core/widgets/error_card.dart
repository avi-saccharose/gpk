import 'package:flutter/material.dart';
import 'package:gpk_app/core/constants/app_sizes.dart';
import 'package:hugeicons/hugeicons.dart';

class ErrorCard extends StatelessWidget {
  final String message;
  final VoidCallback? retry;
  const ErrorCard({super.key, required this.message, this.retry});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    return Card(
      elevation: 0,
      color: colorScheme.errorContainer.withValues(alpha: 0.5),
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: colorScheme.error,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HugeIcon(
              icon: HugeIcons.strokeRoundedWifiError01,
              color: colorScheme.error,
            ),
            gapW8,
            Text(
              message,
              style: textTheme.titleSmall?.copyWith(
                color: colorScheme.error,
              ),
            ),
            if (retry != null) ...[
              const Spacer(),
              FilledButton.tonalIcon(
                onPressed: retry,
                icon: const HugeIcon(icon: HugeIcons.strokeRoundedRefresh01),
                label: const Text('retry'),
                style: FilledButton.styleFrom(
                  backgroundColor: colorScheme.errorContainer,
                  foregroundColor: colorScheme.onErrorContainer,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
