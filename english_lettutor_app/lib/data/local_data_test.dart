import 'package:english_lettutor_app/constants/constants.dart';
import 'package:english_lettutor_app/models/course/course.dart';
import 'package:english_lettutor_app/models/messager/conversation.dart';
import 'package:english_lettutor_app/models/profile/profile.dart';
import 'package:english_lettutor_app/models/teacher/schedule.dart';
import 'package:english_lettutor_app/models/teacher/schedule_history.dart';
import 'package:english_lettutor_app/models/teacher/teacher.dart';
import 'package:flutter/material.dart';

final teacherList = [
  Teacher.getDefault(),
  Teacher.getDefault2(),
  Teacher.getDefault3(),
  Teacher.getDefault4(),
  Teacher(
      id: 5,
      name: 'Teacher 5',
      specialties: kSpecialities.sublist(3, 5),
      country: "Viet nam",
      description: ""),
  Teacher(
      id: 6,
      name: 'Teacher 6',
      specialties: kSpecialities.sublist(3, 5),
      country: "Viet nam",
      description: ""),
  Teacher(
      id: 7,
      name: 'Teacher 7',
      specialties: kSpecialities.sublist(3, 5),
      country: "Viet nam",
      description: ""),
  Teacher(
      id: 8,
      name: 'Teacher 8',
      specialties: kSpecialities.sublist(3, 5),
      country: "Viet nam",
      description: ""),
  Teacher(
      id: 9,
      name: 'Teacher 9',
      specialties: kSpecialities.sublist(3, 5),
      country: "Viet nam",
      description: ""),
  Teacher(
      id: 10,
      name: 'Teacher 10',
      specialties: kSpecialities.sublist(3, 5),
      country: "Viet nam",
      description: ""),
  Teacher(
      id: 11,
      name: 'Teacher 11',
      specialties: kSpecialities.sublist(3, 5),
      country: "Viet nam",
      description: ""),
  Teacher(
      id: 12,
      name: 'Teacher 12',
      specialties: kSpecialities.sublist(3, 5),
      country: "Viet nam",
      description: ""),
  Teacher(
      id: 13,
      name: 'Teacher 13',
      specialties: kSpecialities.sublist(3, 5),
      country: "Viet nam",
      description: ""),
  Teacher(
      id: 14,
      name: 'Teacher 14',
      specialties: kSpecialities.sublist(3, 5),
      country: "Viet nam",
      description: ""),
];

final conversationList = [
  Conversation.getDefault(),
];

final courseList = [
  Course.getDefault(),
  Course.getDefault1(),
  Course.getDefault2(),
  Course.getDefault1(),
  Course.getDefault2(),
  Course.getDefault(),
];

final List<Schedule> scheduleList = [
  Schedule.getDefault(),
  Schedule(
      iDTeacher: 1,
      iDStudent: 1,
      time: DateTimeRange(
          start: DateTime.now().add(const Duration(days: 1)),
          end: DateTime.now().add(const Duration(days: 1, minutes: 30)))),
  Schedule(
      iDTeacher: 2,
      iDStudent: 1,
      time: DateTimeRange(
          start: DateTime.now().add(const Duration(days: 1, hours: 1)),
          end: DateTime.now()
              .add(const Duration(days: 1, hours: 1, minutes: 30)))),
  Schedule(
      iDTeacher: 2,
      iDStudent: 1,
      time: DateTimeRange(
          start: DateTime.now().add(const Duration(days: 1, hours: 2)),
          end: DateTime.now()
              .add(const Duration(days: 1, hours: 2, minutes: 30)))),
  Schedule(
      iDTeacher: 3,
      iDStudent: 1,
      time: DateTimeRange(
          start: DateTime.now().add(const Duration(days: 2, hours: 1)),
          end: DateTime.now()
              .add(const Duration(days: 2, hours: 1, minutes: 30)))),
  Schedule(
      iDTeacher: 3,
      iDStudent: 1,
      time: DateTimeRange(
          start: DateTime.now().add(const Duration(days: 2, hours: 2)),
          end: DateTime.now()
              .add(const Duration(days: 2, hours: 2, minutes: 30)))),
  Schedule(
      iDTeacher: 4,
      iDStudent: 1,
      time: DateTimeRange(
          start: DateTime.now().add(const Duration(days: 3, hours: 1)),
          end: DateTime.now()
              .add(const Duration(days: 3, hours: 1, minutes: 30)))),
  Schedule(
      iDTeacher: 4,
      iDStudent: 1,
      time: DateTimeRange(
          start: DateTime.now().add(const Duration(days: 3, hours: 3)),
          end: DateTime.now()
              .add(const Duration(days: 3, hours: 3, minutes: 30)))),
  Schedule(
      iDTeacher: 2,
      iDStudent: 1,
      time: DateTimeRange(
          start: DateTime.now().add(const Duration(days: 4, hours: 1)),
          end: DateTime.now()
              .add(const Duration(days: 4, hours: 1, minutes: 30)))),
  Schedule(
      iDTeacher: 5,
      iDStudent: 1,
      time: DateTimeRange(
          start: DateTime.now().add(const Duration(days: 5, hours: 1)),
          end: DateTime.now()
              .add(const Duration(days: 5, hours: 1, minutes: 30)))),
  Schedule(
      iDTeacher: 4,
      iDStudent: 1,
      time: DateTimeRange(
          start: DateTime.now().add(const Duration(days: 6, hours: 1)),
          end: DateTime.now()
              .add(const Duration(days: 6, hours: 1, minutes: 30)))),
];

final List<ScheduleHistory> scheduleHistoryList = [
  ScheduleHistory.getDefault()
];

final Profile kProfile = Profile.getDefault2();
