import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime {
  DateTime normalize() {
    return DateTime(year, month, day);
  }

  bool isSameDay(DateTime other) => normalize() == other.normalize();

  bool get isToday => normalize() == DateTime.now().normalize();

  bool get isWeekend =>
      weekday == DateTime.saturday || weekday == DateTime.sunday;

  // formatters
  String get dayNum => DateFormat.d().format(this);
  String get shortDay => DateFormat.E().format(this); // Mon
  String get shortDate => DateFormat.yMMMd().format(this); // 2026 Apr 32
  String get monthDate => DateFormat.MMMd().format(this); // Apr 2
}
