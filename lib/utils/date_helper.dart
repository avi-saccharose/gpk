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
