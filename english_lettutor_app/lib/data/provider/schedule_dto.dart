import 'package:english_lettutor_app/data/provider/base_dto.dart';
import 'package:english_lettutor_app/models/teacher/schedule.dart';

class ScheduleDTO extends BaseDTO<Schedule> {
  Schedule getUpcomingLessionSchedule() {
    Schedule? result = items.firstWhere((element) =>
        element.fromTime.isAfter(DateTime.now()) &&
        element.fromTime.difference(DateTime.now()).inDays <= 1);

    return result;
  }
}
