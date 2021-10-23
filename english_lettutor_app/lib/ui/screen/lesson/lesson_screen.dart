import 'package:flutter/material.dart';

import 'components/lesson_body.dart';

class LessonScreen extends StatelessWidget {
  static String routeName = "/lesson";
  const LessonScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: LessonBody(),
    );
  }
}
