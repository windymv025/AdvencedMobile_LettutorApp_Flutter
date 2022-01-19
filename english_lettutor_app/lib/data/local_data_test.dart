import 'dart:math';

import 'package:english_lettutor_app/constants/constants.dart';
import 'package:english_lettutor_app/models/course/course.dart';
import 'package:english_lettutor_app/models/messager/conversation.dart';
import 'package:english_lettutor_app/models/teacher/schedule.dart';
import 'package:english_lettutor_app/models/teacher/schedule_history.dart';
import 'package:english_lettutor_app/models/teacher/teacher.dart';
import 'package:flutter/material.dart';

final teacherList = [
  // Teacher.getDefault(),
  // Teacher.getDefault2(),
  // Teacher.getDefault3(),
  // Teacher.getDefault4(),
];

final conversationList = [
  Conversation.getDefault(),
];

final courseList = [
  Course.getDefault(),
  Course.getDefault1(),
  Course.getDefault2(),
];

final List<Schedule> scheduleList = [
  Schedule.getDefault(),
];

final List<ScheduleHistory> scheduleHistoryList = [
  ScheduleHistory.getDefault()
];

// final Profile kProfile = Profile.getDefault2();

void randomData() {
  var rd = Random.secure();

  for (int i = 5; i <= 50; i++) {
    int a = rd.nextInt(kSpecialities.length - 1) + 1;
    int b = rd.nextInt(kSpecialities.length - 1) + 1;
    teacherList.add(Teacher(
        id: "id_$i",
        name: 'Teacher ${rd.nextInt(100)}',
        specialties: kSpecialities.sublist(min(a, b), max(a, b)),
        country: "Viet nam",
        description: ""));
  }

  for (int i = 0; i < 20; i++) {
    int day = rd.nextInt(60);
    int hour = rd.nextInt(24);
    scheduleList.add(Schedule(
        iDTeacher: rd.nextInt(50) + 1,
        iDStudent: 1,
        time: DateTimeRange(
            start: DateTime.now().add(Duration(days: day, hours: hour)),
            end: DateTime.now()
                .add(Duration(days: day, hours: hour, minutes: 30)))));

    scheduleList.add(Schedule(
        iDTeacher: rd.nextInt(50) + 1,
        iDStudent: 1,
        time: DateTimeRange(
            start: DateTime.now().add(Duration(days: day, hours: hour)),
            end: DateTime.now().add(Duration(
                days: day, hours: hour, minutes: rd.nextInt(60 + 1))))));
  }

  for (int i = 0; i < 30; i++) {
    int day = rd.nextInt(365);
    scheduleHistoryList.add(ScheduleHistory(
        schedule: Schedule(
            iDTeacher: rd.nextInt(50) + 1,
            iDStudent: 1,
            time: DateTimeRange(
                start: DateTime.now().subtract(Duration(days: day, hours: 1)),
                end: DateTime.now()
                    .add(Duration(days: day, hours: 1, minutes: 30)))),
        countTime: rd.nextInt(30000),
        ratingComment: null));
  }

  for (int i = 0; i < 30; i++) {
    courseList.add(
      Course(
        image: null,
        name: "Course $i",
        subtitle: "Course $i subtitle",
        level: kLevels[rd.nextInt(kLevels.length)],
        lessons: rd.nextInt(20) + 1,
        topics: [for (int i = 1; i < rd.nextInt(20) + 1; i++) 'Topic $i'],
      ),
    );
  }
}
