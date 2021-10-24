import 'package:english_lettutor_app/models/rating_comment.dart';
import 'package:english_lettutor_app/models/schedule.dart';

class ScheduleHistory {
  late Schedule schedule;
  late int countTime;
  late RatingComment ratingComment;

  ScheduleHistory(
      {required this.schedule,
      required this.countTime,
      required this.ratingComment});
  ScheduleHistory.getDefault() {
    schedule = Schedule.getDefault();
    countTime = (25 * 60 + 11) * 1000;
    ratingComment = RatingComment.getDefault();
  }
}