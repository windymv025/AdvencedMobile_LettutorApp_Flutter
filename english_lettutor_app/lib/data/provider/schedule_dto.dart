import 'package:english_lettutor_app/data/network/apis/schedule/schedule-api.dart';
import 'package:english_lettutor_app/data/provider/base_dto.dart';
import 'package:english_lettutor_app/models/page/paging_info.dart';
import 'package:english_lettutor_app/models/schedule/my-schedule.dart';
import 'package:english_lettutor_app/models/teacher/schedule.dart';
import 'package:intl/intl.dart';

class ScheduleDTO extends BaseDTO<Schedule> {
  final ScheduleApi _api = ScheduleApi();

  MyScheduleList myScheduleList = MyScheduleList();
  void init() {
    loadScheduleData();
  }

  Future<void> loadScheduleData() async {
    var value = await _api.getBookedClassesFull(1);
    if (value["data"] != null) {
      myScheduleList = MyScheduleList.fromMap(value["data"]);
      items = myScheduleList.getScheduleList();
      pagingInfo = PagingInfo(12, items.length);

      notifyListeners();
    }
  }

  @override
  void sort() {
    items.sort((a, b) => a.time.start.compareTo(b.time.start));
  }

  @override
  void getAvailableItems() {
    items = items
        .where((schedule) => schedule.time.end.isAfter(DateTime.now()))
        .toList();
  }

  Map<String, List<Schedule>> getScheduleByDay() {
    var result = <String, List<Schedule>>{};
    for (var schedule in getItemInCurrentPage()) {
      var date = schedule.time.start.toLocal();
      var strDate = DateFormat('EEEE, dd MMMM yyyy').format(date);
      if (result[strDate] == null) {
        result[strDate] = [];
      }
      result[strDate]?.add(schedule);
    }
    return result;
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
}
