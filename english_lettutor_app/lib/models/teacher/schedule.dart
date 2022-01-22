import 'package:english_lettutor_app/models/teacher/teacher.dart';
import 'package:english_lettutor_app/ui/screen/home/schedule_page/components/schedule_item.dart';
import 'package:flutter/material.dart';

class Schedule {
  String? iDTeacher;
  String? iDStudent;
  String? scheduleDetailId;
  DateTimeRange time;
  Teacher? teacher;
  String? tutorMeetingLink;
  String? studentMeetingLink;

  Schedule({
    this.iDTeacher,
    required this.time,
    this.iDStudent,
    this.scheduleDetailId,
    this.teacher,
    this.studentMeetingLink,
    this.tutorMeetingLink,
  });
}
