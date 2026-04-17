import 'package:gpk_app/core/models/branch.dart';
import 'package:gpk_app/core/models/user_preferences.dart';
import 'package:gpk_app/features/routine/models/day_enum.dart';
import 'package:gpk_app/features/routine/models/routine_schedule.dart';
import 'package:gpk_app/features/routine/models/timeline_item.dart';
import 'package:hive_ce/hive_ce.dart';
import 'package:gpk_app/features/calendar/models/event.dart';

@GenerateAdapters([
  AdapterSpec<Branch>(),
  AdapterSpec<UserPreferences>(),
  AdapterSpec<EventGroup>(),
  AdapterSpec<Event>(),
  AdapterSpec<Day>(),
  AdapterSpec<TimelineItem>(),
  AdapterSpec<RoutineSchedule>(),
])
part 'hive_adapters.g.dart';
