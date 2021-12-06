import 'package:english_lettutor_app/models/teacher/schedule_history.dart';

import 'base_dto.dart';

class ScheduleHistoryDTO extends BaseDTO<ScheduleHistory> {
  String getTotalTimeStudy() {
    if (items.isEmpty) return "0 minutes";

    int totalMinutes = 0;
    for (var scheduleHistory in items) {
      totalMinutes += scheduleHistory.countTime ~/ 1000;
    }

    if (totalMinutes ~/ 60 < 1) {
      return "$totalMinutes minutes";
    } else {
      return "${totalMinutes ~/ 60} hours ${totalMinutes % 60} minutes";
    }
  }
}
