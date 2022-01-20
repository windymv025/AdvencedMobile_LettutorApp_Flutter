import 'dart:math';

import 'package:english_lettutor_app/constants/constants.dart';
import 'package:english_lettutor_app/models/course/course.dart';
import 'package:english_lettutor_app/models/messager/conversation.dart';
import 'package:english_lettutor_app/models/teacher/schedule.dart';
import 'package:english_lettutor_app/models/teacher/schedule_history.dart';
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

final courseList = [];

final List<Schedule> scheduleList = [];

final List<ScheduleHistory> scheduleHistoryList = [];

// final Profile kProfile = Profile.getDefault2();

void randomData() {
  var rd = Random.secure();
}
