import 'package:english_lettutor_app/constants/constants.dart';
import 'package:english_lettutor_app/data/network/apis/course-ebook/course-api.dart';
import 'package:english_lettutor_app/models/course/course-models.dart';
import 'package:english_lettutor_app/models/course/course.dart';
import 'package:english_lettutor_app/models/page/paging_info.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:fuzzy/fuzzy.dart';

import 'base_dto.dart';

class CourseDTO extends BaseDTO<Course> {
  final CourseApi _courseApi = CourseApi();

  init() async {
    await loadCourse();
    clearSearch();
  }

  Future loadCourse() async {
    var res = await _courseApi.getListCourseWithPaginaion(1);
    if (res["data"] != null) {
      CourseModel courseModel = CourseModel.fromMap(res["data"]);
      addAll(courseModel.courses);
      pagingInfo = PagingInfo(12, courseModel.count!);
      notifyListeners();
    }
  }

  List<Course> getRecommentList(String level) {
    var result = items.where((element) => element.level == level).toList();
    if (result.isEmpty) {
      result = items;
    }
    if (result.length > 5) {
      return result.sublist(0, 5);
    }

    return result;
  }

  void getCourseListByLevel(String level) {
    clearSearch();
    if (level != kAll) {
      var result = items.where((element) => element.level == level).toList();
      super.items = result;
      pagingInfo = PagingInfo(12, result.length);
    }
  }

  void search(String value) {
    FirebaseAnalytics.instance.logSearch(searchTerm: value);

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
