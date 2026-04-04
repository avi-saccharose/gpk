import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gpk_app/constants/app_sizes.dart';
import 'package:gpk_app/features/routine/data/mock_routine_repository.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final routineList = MockRoutineRepository.instance.getRoutine();
    return SafeArea(
      child: Padding(
        padding: EdgeInsetsGeometry.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            gapH20,
            Text(
              'Class today',
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
