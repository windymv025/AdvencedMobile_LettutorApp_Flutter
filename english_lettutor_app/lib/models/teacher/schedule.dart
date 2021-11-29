import 'teacher.dart';

class Schedule {
  late Teacher teacher;
  late DateTime fromTime;
  late DateTime toTime;

  Schedule(
      {required this.teacher, required this.fromTime, required this.toTime});

  Schedule.getDefault() {
    teacher = Teacher.getDefault();
    fromTime = DateTime(2021, 10, 20, 15);
    toTime = DateTime(2021, 10, 20, 15, 30);
  }
}
