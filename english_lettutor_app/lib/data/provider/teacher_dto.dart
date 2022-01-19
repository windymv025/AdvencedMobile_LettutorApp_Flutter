import 'package:english_lettutor_app/constants/constants.dart';
import 'package:english_lettutor_app/data/network/apis/tutor/tutor-api.dart';
import 'package:english_lettutor_app/models/page/paging_info.dart';
import 'package:english_lettutor_app/models/teacher/teacher.dart';
import 'package:english_lettutor_app/models/teacher/tutor-page.dart';

import 'base_dto.dart';

class TeacherDTO extends BaseDTO<Teacher> {
  final List<String> _specialities = [];
  final List<Teacher> _favorite = [];
  final TutorApi _tutorApi = TutorApi();
  String keySearch = "";

  List<String> getSpecialities() => _specialities;

  void addSpeciality(String speciality) {
    _specialities.add(speciality);
    items = getTeachersByspecialities();

    notifyListeners();
  }

  void removeSpeciality(String speciality) {
    _specialities.remove(speciality);
    clearSearch();
    items = getTeachersByspecialities();
    sortListTeachers();

    notifyListeners();
  }

  void clearSpecialities() {
    _specialities.clear();
    clearSearch();
    sortListTeachers();

    notifyListeners();
  }

  @override
  List<Teacher> get items {
    super.items.sort((a, b) {
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
    return super.items;
  }

  List<Teacher> getRecommendedTeachers() {
    var result = items
        .where((teacher) => teacher.ratings! > 3.5 || teacher.isFavorite)
        .toList();
    if (result.length > 10) {
      result.sublist(0, 10);
    }

    return result;
  }

  List<Teacher> getTeachersByspecialities() {
    if (_specialities.isEmpty) {
      clearSearch();

      return items;
    }

    var result = items.where((element) {
      for (var speciality in _specialities) {
        for (var item in element.specialties!) {
          if (kMapSpecialities[item] == speciality) {
            return true;
          }
        }
      }
      return false;
    }).toList();

    pagingInfo = PagingInfo(12, result.length);

    return result;
  }

  void sortListTeachers() {
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
    if (value.isEmpty) {
      loadTutorsInPage(1);
      return;
    }
    _tutorApi
        .searchTutor(value,
            specialties: _specialities.isEmpty ? null : _specialities)
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

  void init() {
    loadTutorsInPage(1);
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
}
