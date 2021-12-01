import 'package:english_lettutor_app/models/teacher/teacher.dart';

import 'base_dto.dart';

class TeacherDTO extends BaseDTO<Teacher> {
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
}
