import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gpk_app/features/routine/models/timeline_item.dart';
import 'package:gpk_app/core/providers/clock_provider.dart';
import 'package:gpk_app/core/providers/routine_providers.dart';
import 'package:test/test.dart';

import '../helpers/routine_builder.dart';

void main() {
  // ProviderContainer createContainer({
  //   required List<TimelineItem> routine,
  //   required AsyncValue<int> minutesNow,
  // }) {
  //   final container = ProviderContainer(
  //     overrides: [
  //       routineProvider.overrideWithValue(routine),
  //       minutesNowProvider.overrideWithValue(minutesNow),
  //     ],
  //   );
  //
  //   addTearDown(container.dispose);
  //   return container;
  // }
  //
  // group("routineProvider Tests", () {
  //   test('return null when time is 0', () {
  //     final container = createContainer(
  //       routine: RoutineBuilder.createStandardRoutine(),
  //       minutesNow: AsyncValue.data(0),
  //     );
  //     expect(container.read(activeRoutineIndexProvider), 0);
  //   });
  //
  //   test('return first item when time is 1', () {
  //     final container = createContainer(
  //       routine: RoutineBuilder.createStandardRoutine(),
  //       minutesNow: AsyncValue.data(1),
  //     );
  //     expect(container.read(activeRoutineIndexProvider), 0);
  //   });
  //
  //   test('return second item when time is 11', () {
  //     final container = createContainer(
  //       routine: RoutineBuilder.createStandardRoutine(),
  //       minutesNow: AsyncValue.data(11),
  //     );
  //     expect(container.read(activeRoutineIndexProvider), 1);
  //   });
  //
  //   test('return null item when time is 41', () {
  //     final container = createContainer(
  //       routine: RoutineBuilder.createStandardRoutine(),
  //       minutesNow: AsyncValue.data(41),
  //     );
  //     expect(container.read(activeRoutineIndexProvider), null);
  //   });
  // });
}
