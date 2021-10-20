import 'package:english_lettutor_app/ui/widget/item_list/course_item.dart';
import 'package:english_lettutor_app/utilities/constants/assets.dart';
import 'package:english_lettutor_app/utilities/constants/constants.dart';
import 'package:flutter/material.dart';

class RecommendedCourse extends StatefulWidget {
  const RecommendedCourse({Key? key}) : super(key: key);

  @override
  _RecommendedCourseState createState() => _RecommendedCourseState();
}

class _RecommendedCourseState extends State<RecommendedCourse> {
  final List<Widget> teachers = [
    SizedBox(
      width: 200,
      child: CourseItem(
        image: Image.asset(Assets.assetsImagesTextLogo),
        name: "Basic Conversation: ABC DEF GHT",
        subTitile: "Gain confidence speaking about familiar topics",
        level: kLevels[0],
        lessons: 10,
      ),
    ),
    SizedBox(
      width: 200,
      child: CourseItem(
        image: Image.asset(Assets.assetsImagesCloudData),
        name: "Basic Conversation",
        subTitile: "Gain confidence speaking about familiar topics",
        level: kLevels[0],
        lessons: 10,
      ),
    ),
    SizedBox(
      width: 200,
      child: CourseItem(
        image: Image.asset(Assets.assetsImagesNoDataFound),
        name: "Basic Conversation",
        subTitile: "Gain confidence speaking about familiar topics",
        level: kLevels[0],
        lessons: 10,
      ),
    ),
    SizedBox(
      width: 200,
      child: CourseItem(
        image: Image.asset(Assets.assetsImagesNoDataFound),
        name: "Basic Conversation",
        subTitile: "Gain confidence speaking about familiar topics",
        level: kLevels[0],
        lessons: 10,
      ),
    ),
    SizedBox(
      width: 200,
      child: CourseItem(
        image: Image.asset(Assets.assetsImagesNoDataFound),
        name: "Basic Conversation",
        subTitile: "Gain confidence speaking about familiar topics",
        level: kLevels[0],
        lessons: 10,
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const ScrollPhysics(),
      primary: false,
      child: Row(children: teachers),
    );
  }
}
