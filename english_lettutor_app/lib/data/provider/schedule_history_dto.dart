import 'package:english_lettutor_app/data/network/apis/schedule/schedule-api.dart';
import 'package:english_lettutor_app/models/page/paging_info.dart';
import 'package:english_lettutor_app/models/schedule/my-schedule.dart';
import 'package:english_lettutor_app/models/teacher/schedule.dart';

import 'base_dto.dart';

class ScheduleHistoryDTO extends BaseDTO<Schedule> {
  final ScheduleApi _api = ScheduleApi();

  MyScheduleList myScheduleList = MyScheduleList();
  void init() {
    loadScheduleData();
  }

  Future<void> loadScheduleData() async {
    DateTime today =
        DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
    var value =
        await _api.getBookedClasses(1, DateTime.now().millisecondsSinceEpoch);
    if (value["data"] != null) {
      myScheduleList = MyScheduleList.fromMap(value["data"]);
      items = myScheduleList.getScheduleHistoryList();
      pagingInfo = PagingInfo(12, items.length);

      notifyListeners();
    }
  }

  String getTotalTimeStudy() {
    if (items.isEmpty) return "0 minutes";

    int totalMinutes = 0;
    for (var scheduleHistory in items) {
      totalMinutes += scheduleHistory.time.duration.inMinutes;
    }

    if (totalMinutes ~/ 60 < 1) {
      return "$totalMinutes minutes";
    } else {
      return "${totalMinutes ~/ 60} hours ${totalMinutes % 60} minutes";
    }
  }
}
