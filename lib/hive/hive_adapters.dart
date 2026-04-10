import 'package:hive_ce/hive_ce.dart';
import 'package:gpk_app/features/calendar/models/event.dart';

@GenerateAdapters([
  AdapterSpec<EventGroup>(),
  AdapterSpec<Event>(),
])
part 'hive_adapters.g.dart';
