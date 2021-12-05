import 'package:flutter/material.dart';

class Schedule {
  late int iDTeacher;
  late int? iDStudent;
  late DateTimeRange time;

  Schedule({required this.iDTeacher, required this.time, this.iDStudent});

  Schedule.getDefault() {
    iDTeacher = 1;
    iDStudent = 1;
    time = DateTimeRange(
        start: DateTime(2021, 10, 20, 15), end: DateTime(2021, 10, 20, 15, 35));
  }
}
