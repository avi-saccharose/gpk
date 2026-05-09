import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:gpk_app/core/constants/app_sizes.dart';
import 'package:gpk_app/core/utils/text_styles.dart';
import 'package:hugeicons/hugeicons.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: HugeIcon(icon: HugeIcons.strokeRoundedSettings05, size: 30.0),
            onPressed: () => context.push('/setting'),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsetsGeometry.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              gapH20,
              Text(
                "Hello",
                style: AppTextStyles.label,
              ),
              Text(
                "Avi",
                style: AppTextStyles.display,
              ),
              gapH20,
              Card(
                elevation: 4,
                shadowColor: Colors.black.withValues(alpha: 0.4),
                surfaceTintColor: Colors.transparent,
                color: Theme.of(
                  context,
                ).colorScheme.surface, //Colors.white.withValues(alpha: 0.9),
                child: Padding(
                  padding: EdgeInsetsGeometry.all(16),
                  child: Center(
                    child: Text("Hello"),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
