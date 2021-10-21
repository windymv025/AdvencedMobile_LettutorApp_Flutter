import 'package:flutter/material.dart';

import 'components/course_detail_body.dart';

class CourseDetailScreen extends StatelessWidget {
  static String routeName = "/course_detail";
  const CourseDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const CourseDetailBody(),
    );
  }
}
