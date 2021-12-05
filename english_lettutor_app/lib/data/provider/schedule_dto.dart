import 'package:english_lettutor_app/data/provider/base_dto.dart';
import 'package:english_lettutor_app/models/teacher/schedule.dart';

class ScheduleDTO extends BaseDTO<Schedule> {
  @override
  void sort() {
    items.sort((a, b) => a.time.start.compareTo(b.time.start));
  }

  List<Schedule> getAvailableSchedule() {
    return items
        .where((schedule) => schedule.time.end.isAfter(DateTime.now()))
        .toList();
  }

  Schedule? getUpcomingLessionSchedule() {
    if (items.isEmpty) return null;

    Schedule? result;
    var temp = items
        .where(
          (schedule) => schedule.time.start.isAfter(DateTime.now()),
        )
        .toList();
    temp.sort((a, b) => a.time.start.compareTo(b.time.start));

    if (temp.isNotEmpty) {
      result = temp.first;
    }

    return result;
  }

  String getTotalTimeStudy() {
    if (items.isEmpty) return "0 minutes";

    int totalMinutes = 0;
    for (var schedule in items) {
      totalMinutes += schedule.time.duration.inMinutes;
    }

    if (totalMinutes % 60 > 0) {
      return "$totalMinutes minutes";
    } else {
      return "${totalMinutes ~/ 60} hours ${totalMinutes % 60} minutes";
    }
  }
}
