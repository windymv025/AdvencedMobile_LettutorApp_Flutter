import 'package:english_lettutor_app/models/course/course.dart';
import 'package:english_lettutor_app/models/messager/conversation.dart';
import 'package:english_lettutor_app/models/profile/profile.dart';
import 'package:english_lettutor_app/models/teacher/schedule.dart';
import 'package:english_lettutor_app/models/teacher/schedule_history.dart';
import 'package:english_lettutor_app/models/teacher/teacher.dart';

final teacherList = [
  Teacher.getDefault(),
  Teacher.getDefault2(),
  Teacher.getDefault3(),
  Teacher.getDefault4(),
  Teacher.getDefault(),
  Teacher.getDefault2(),
  Teacher.getDefault3(),
  Teacher.getDefault4(),
  Teacher.getDefault(),
  Teacher.getDefault2(),
  Teacher.getDefault3(),
  Teacher.getDefault4(),
  Teacher.getDefault(),
  Teacher.getDefault2(),
  Teacher.getDefault3(),
  Teacher.getDefault4(),
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

final List<Schedule> scheduleList = [Schedule.getDefault()];

final List<ScheduleHistory> scheduleHistoryList = [
  ScheduleHistory.getDefault()
];

final Profile kProfile = Profile.getDefault();
