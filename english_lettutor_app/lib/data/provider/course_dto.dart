import 'package:english_lettutor_app/models/course/course.dart';
import 'package:english_lettutor_app/models/page/paging_info.dart';
import 'package:fuzzy/fuzzy.dart';

import 'base_dto.dart';

class CourseDTO extends BaseDTO<Course> {
  List<Course> getRecommentList(String level) {
    var result = items.where((element) => element.level == level).toList();
    if (result.length > 5) {
      return result.sublist(0, 5);
    }
    return result;
  }

  void getCourseListByLevel(String level) {
    clearSearch();
    if (level != "All") {
      var result = items.where((element) => element.level == level).toList();
      super.items = result;
      pagingInfo = PagingInfo(12, result.length);
    }
  }

  void search(String value) {
    if (value.isEmpty) {
      clearSearch();
      return;
    }

    List<Course> result = [];

    final fuse = Fuzzy(
      items.map((e) => e.name).toList(),
      options: FuzzyOptions(
        findAllMatches: true,
        tokenize: true,
        threshold: 0.5,
        keys: [],
      ),
    );
    final temp = fuse.search(value).map((result) => result.item).toList();
    for (var element in temp) {
      result.add(items
          .where((i) =>
              i.name!.toLowerCase().contains(element.toString().toLowerCase()))
          .first);
    }

    pagingInfo = PagingInfo(10, result.length);

    super.items = result;
    notifyListeners();
  }
}
