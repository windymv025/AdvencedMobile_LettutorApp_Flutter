import 'package:english_lettutor_app/models/teacher/teacher.dart';

import 'base_dto.dart';

class TeacherDTO extends BaseDTO<Teacher> {
  List<Teacher> getRecommendedTeachers() {
    return items.where((teacher) => teacher.ratings! > 4.0).toList();
  }
}
