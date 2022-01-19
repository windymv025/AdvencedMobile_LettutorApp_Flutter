import 'package:english_lettutor_app/constants/constants.dart';
import 'package:english_lettutor_app/data/network/apis/schedule/schedule-api.dart';
import 'package:english_lettutor_app/data/network/apis/tutor/tutor-api.dart';
import 'package:english_lettutor_app/models/page/paging_info.dart';
import 'package:english_lettutor_app/models/schedule/schedule-teacher.dart';
import 'package:english_lettutor_app/models/teacher/teacher.dart';
import 'package:english_lettutor_app/models/teacher/tutor-page.dart';
import 'package:intl/intl.dart';

import 'base_dto.dart';

class TeacherDTO extends BaseDTO<Teacher> {
  final List<String> _specialities = [];
  final List<Teacher> _favorite = [];
  final List<ScheduleTeacher> _teacherSchedule = [];
  final Map<String, List<ScheduleTeacher>> _schedule = {};

  List<ScheduleTeacher> get teacherSchedule => _teacherSchedule;

  final ScheduleApi _scheduleApi = ScheduleApi();
  final TutorApi _tutorApi = TutorApi();
  String keySearch = "";

  void init() {
    if (keySearch.isEmpty && _specialities.isEmpty) {
      loadTutorsInPage(1);
    }
  }

  List<Teacher> getRecommendedTeachers() {
    sortTeacher();

    var result = items
        .where((teacher) => teacher.ratings! > 3.5 || teacher.isFavorite)
        .toList();
    return result;
  }

  void loadTutorsInPage(int page) {
    _tutorApi.getListTutorWithPagination(page).then((tutors) {
      if (tutors["tutors"] != null) {
        TutorInPage _tutorInPage = TutorInPage.fromMap(tutors);
        addAll(_tutorInPage.tutors.getTutorList());
        pagingInfo = PagingInfo(12, _tutorInPage.tutors.count);
        pagingInfo.currentPage = page;

        addAllFavorite(_tutorInPage.getFavorite());
      } else {
        clear();
      }
      notifyListeners();
    });
  }

  void addAllFavorite(List<Teacher> favorite) {
    _favorite.clear();
    _favorite.addAll(favorite);
    for (var item in items) {
      if (_favorite.where((element) => element.id == item.id).isNotEmpty) {
        item.isFavorite = true;
      } else {
        item.isFavorite = false;
      }
    }
  }

  @override
  void nextPage() {
    if (pagingInfo.currentPage < pagingInfo.totalPage) {
      pagingInfo.currentPage++;
      loadTutorsInPage(pagingInfo.currentPage);
    }
  }

  @override
  void prevPage() {
    if (pagingInfo.currentPage > 1) {
      pagingInfo.currentPage--;
      loadTutorsInPage(pagingInfo.currentPage);
    }
  }

  List<String> getSpecialities() => _specialities;

  void addSpeciality(String speciality) {
    _specialities.add(speciality);
    getTeachersByspecialities();
  }

  void removeSpeciality(String speciality) {
    _specialities.remove(speciality);
    getTeachersByspecialities();
  }

  void clearSpecialities() {
    _specialities.clear();
    clearSearch();
  }

  @override
  List<Teacher> get items {
    return super.items;
  }

  void getTeachersByspecialities() {
    search(keySearch);
  }

  void sortTeacher() {
    items.sort((a, b) {
      int result = 0;
      if (a.isFavorite && !b.isFavorite) {
        result = -1;
      } else if (!a.isFavorite && b.isFavorite) {
        result = 1;
      } else {
        result = b.ratings!.compareTo(a.ratings!);
      }
      return result;
    });
  }

  void updateFavorite(Teacher teacher) {
    teacher.isFavorite = !teacher.isFavorite;
    teacher.isFavorite
        ? _favorite.add(teacher)
        : _favorite.removeWhere((element) => element.id == teacher.id);
    _tutorApi.addATutorToFavouriteList(teacher.id);
    notifyListeners();
  }

  void search(String value) {
    keySearch = value;
    if (value.isEmpty && _specialities.isEmpty) {
      clearSearch();
      return;
    }
    var listKeySpec = <String>[];
    for (var i in kMapSpecialities.keys) {
      if (_specialities.contains(kMapSpecialities[i])) {
        listKeySpec.add(i);
      }
    }

    _tutorApi
        .searchTutor(value,
            specialties: listKeySpec.isEmpty ? null : listKeySpec)
        .then((value) {
      var res = Tutors.fromMap(value);
      pagingInfo = PagingInfo(12, res.count);
      addAll(res.getTutorList());
      notifyListeners();
    });
  }

  List<Teacher> getFavoriteTeachers() {
    return _favorite;
  }

  Teacher getTeacher(String iDTeacher) {
    return items.firstWhere((element) => element.id == iDTeacher);
  }

  @override
  void clearSearch() {
    super.clearSearch();
    keySearch = "";
    loadTutorsInPage(1);
  }

  @override
  List<Teacher> getItemInCurrentPage() {
    sortTeacher();
    return items;
  }

  //schedule booking:--------------------------------
  Future<void> loadScheduleTeacher(String teacherId) async {
    var value = await _scheduleApi.getScheduleByTutorID(teacherId);
    _teacherSchedule.clear();
    List<ScheduleTeacher>? schedule;
    if (value["data"] != null) {
      schedule = value["data"]
          .map<ScheduleTeacher>((e) => ScheduleTeacher.fromMap(e))
          .toList();
    }
    _teacherSchedule.addAll(schedule ?? []);
    notifyListeners();
  }

  List<String> getFreeDate(String teacherId) {
    DateTime now =
        DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day)
            .toLocal();
    _teacherSchedule
        .sort((a, b) => a.startTimestamp!.compareTo(b.startTimestamp!));
    for (var s in _teacherSchedule) {
      String str = DateFormat("dd-MM-yyyy").format(
          DateTime.fromMillisecondsSinceEpoch(s.startTimestamp!).toLocal());
      if (s.startTimestamp! >= now.millisecondsSinceEpoch) {
        if (!_schedule.containsKey(str)) {
          _schedule[str] = [s];
        } else {
          _schedule[str]!.add(s);
        }
      }
    }

    return _schedule.keys.toList();
  }

  List<ScheduleDetail> getFreeTime(String date) {
    List<ScheduleDetail> freeTime = [];
    if (_schedule.containsKey(date)) {
      var listSchedule = _schedule[date];
      for (var s in listSchedule!) {
        freeTime.addAll(
            s.scheduleDetails!.where((element) => element.isBooked == false));
      }
    }
    return freeTime;
  }

  bool checkFreeDate(String str) {
    return _schedule.containsKey(str);
  }

  Future<bool> bookingTeacher(String scheduleId) async {
    var res = await _scheduleApi.bookAClass([scheduleId]);
    if (res["data"] == null) {
      return false;
    }
    return true;
  }
}
