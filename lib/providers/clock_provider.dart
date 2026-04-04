import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gpk_app/core/utils/time_helper.dart';

final minutesNowProvider = StreamProvider<int>((ref) async* {
  yield getMinsNow();
  yield* Stream.periodic(
    const Duration(seconds: 10),
    (_) => getMinsNow(),
  ).distinct();
});
