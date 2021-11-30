import 'package:english_lettutor_app/models/course/course.dart';

import 'base_dto.dart';

class CourseDTO extends BaseDTO<Course> {
  List<Course> getRecommentList(String level) {
    var result = items.where((element) => element.level == level).toList();
    if (result.length > 5) {
      return result.sublist(0, 5);
    }
    return result;
  }
}
