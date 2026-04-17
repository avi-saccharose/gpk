enum Day { monday, tuesday, wednesday, thursday, friday }

extension ToDay on DateTime {
  Day get toDay => Day.values[weekday - 1];
}
