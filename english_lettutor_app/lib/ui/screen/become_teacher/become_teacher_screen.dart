import 'package:english_lettutor_app/data/provider/profile_provider.dart';
import 'package:english_lettutor_app/generated/l10n.dart';
import 'package:english_lettutor_app/models/teacher/teacher.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'components/become_teacher_body.dart';

class BecomeTeacherScreen extends StatelessWidget {
  static String routeName = "/become_teacher";
  const BecomeTeacherScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ProfileProvider profile = Provider.of<ProfileProvider>(context);
    return Provider(
      create: (context) => Teacher.toProfile(profile.backupProfile),
      child: Scaffold(
        appBar: AppBar(
          title: Text(S.current.become_teacher),
        ),
        body: const BecomeTeacherBody(),
      ),
    );
  }
}
