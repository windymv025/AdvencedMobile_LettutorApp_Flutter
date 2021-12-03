import 'package:english_lettutor_app/models/profile/profile.dart';
import 'package:english_lettutor_app/models/teacher/teacher.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'components/become_teacher_body.dart';

class BecomeTeacherScreen extends StatelessWidget {
  static String routeName = "/become_teacher";
  const BecomeTeacherScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Profile profile = Provider.of<Profile>(context);
    return Provider(
      create: (context) => Teacher.toProfile(profile),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Become a Teacher"),
        ),
        body: const BecomeTeacherBody(),
      ),
    );
  }
}
