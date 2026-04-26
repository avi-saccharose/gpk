import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:gpk_app/core/constants/app_sizes.dart';
import 'package:gpk_app/core/widgets/date_today.dart';
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
              DateToday(),
              gapH20,
            ],
          ),
        ),
      ),
    );
  }
}
