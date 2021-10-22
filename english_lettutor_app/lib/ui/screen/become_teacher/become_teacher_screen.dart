import 'package:flutter/material.dart';

import 'components/become_teacher_body.dart';

class BecomeTeacherScreen extends StatelessWidget {
  static String routeName = "/become_teacher";
  const BecomeTeacherScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: BecomeTeacherBody(),
    );
  }
}
