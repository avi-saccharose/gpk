// return the number of days in a month
int getDaysInMonth(int year, int month) {
  return DateTime(year, month + 1, 0).day;
}

// Return list of days in a month
List<DateTime> getDaysListInMonth(int year, int month) {
  final daysCount = getDaysInMonth(year, month);
  return List.generate(
    daysCount,
    (index) => DateTime(year, month, index + 1),
  );
}

// Return the current time in minutes
int getMinsNow() {
  var now = DateTime.now();
  return hmToMins(now.hour, now.minute);
}

// returns the hour and minutes from total minutes
(int, int) minsToHM(int time) {
  final hours = (time / 60).toInt();
  final mins = time % 60;
  return (hours, mins);
}

// convert hours and minutes to total minutes
int hmToMins(int hour, int minutes) {
  return (hour * 60) + minutes;
}

String displayTime(int time) {
  var (hour, minutes) = minsToHM(time);
  String formattedHour = hour.toString().padLeft(2, '0');
  String formattedMinute = minutes.toString().padLeft(2, '0');

  return "$formattedHour:$formattedMinute";
}
