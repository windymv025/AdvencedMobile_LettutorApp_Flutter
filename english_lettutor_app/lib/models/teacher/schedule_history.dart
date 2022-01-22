import 'package:english_lettutor_app/models/teacher/rating_comment.dart';

import 'schedule.dart';

class ScheduleHistory {
  late Schedule schedule;
  late int countTime;
  late RatingComment? ratingComment;

  ScheduleHistory(
      {required this.schedule,
      required this.countTime,
      required this.ratingComment});
}
