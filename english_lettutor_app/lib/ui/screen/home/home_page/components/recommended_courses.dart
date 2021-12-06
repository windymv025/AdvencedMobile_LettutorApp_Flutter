import 'package:english_lettutor_app/constants/assets.dart';
import 'package:english_lettutor_app/constants/constants.dart';
import 'package:english_lettutor_app/data/provider/course_dto.dart';
import 'package:english_lettutor_app/data/provider/profile_provider.dart';
import 'package:english_lettutor_app/models/course/course.dart';
import 'package:english_lettutor_app/ui/widget/item_list/course_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';

class RecommendedCourse extends StatefulWidget {
  const RecommendedCourse({Key? key}) : super(key: key);

  @override
  _RecommendedCourseState createState() => _RecommendedCourseState();
}

class _RecommendedCourseState extends State<RecommendedCourse> {
  @override
  Widget build(BuildContext context) {
    final courseDTO = context.watch<CourseDTO>();
    final profile = context.watch<ProfileProvider>();
    final courses = courseDTO.getRecommentList(profile.level ?? kLevels[0]);
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const ScrollPhysics(),
      primary: false,
      child: Row(children: courses.map((e) => buildCourseItem(e)).toList()),
    );
  }

  Widget buildCourseItem(Course course) {
    return SizedBox(
      width: 200,
      child: CourseItem(
        image: getImage(course.image),
        name: course.name!,
        subTitile: course.subtitle!,
        level: course.level!,
        lessons: course.lessons,
      ),
    );
  }

  Image getImage(String? ulr) {
    if (ulr == null) {
      return Image.asset(
        Assets.assetsImagesCourseImage,
      );
    }
    return Image.asset(
      ulr,
    );
  }
}
