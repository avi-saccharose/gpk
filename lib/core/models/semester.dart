class Semester {
  final int value;
  const Semester(this.value);

  static const first = Semester(1);
  static const second = Semester(2);
  static const third = Semester(3);
  static const fourth = Semester(4);
  static const fifth = Semester(5);
  static const sixth = Semester(6);

  @override
  String toString() => '$value';

  int get year {
    switch (value) {
      case 1:
      case 2:
        return 1;
      case 3:
      case 4:
        return 2;
      case 5:
      case 6:
        return 3;
      default:
        return 0;
    }
  }
}
