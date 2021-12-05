import 'package:english_lettutor_app/models/page/paging_info.dart';
import 'package:english_lettutor_app/models/teacher/teacher.dart';

import 'base_dto.dart';

class TeacherDTO extends BaseDTO<Teacher> {
  final List<String> _specialities = [];

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
        .where((teacher) => teacher.ratings! > 4.0 || teacher.isFavorite)
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
        if (!element.specialties!.contains(speciality)) {
          return false;
        }
      }
      return true;
    }).toList();

    pagingInfo = PagingInfo(10, result.length);

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
    notifyListeners();
  }

  void search(String value) {
    if (value.isEmpty) {
      clearSearch();
      return;
    }

    var result = items.where((element) {
      return element.name!.toLowerCase().contains(value.toLowerCase()) ||
          element.country.toLowerCase().contains(value.toLowerCase());
    }).toList();

    pagingInfo = PagingInfo(10, result.length);

    super.items = result;
    notifyListeners();
  }

  List<Teacher> getFavoriteTeachers() {
    return items.where((element) => element.isFavorite).toList();
  }

  Teacher getTeacher(int iDTeacher) {
    return items.firstWhere((element) => element.id == iDTeacher);
  }
}
