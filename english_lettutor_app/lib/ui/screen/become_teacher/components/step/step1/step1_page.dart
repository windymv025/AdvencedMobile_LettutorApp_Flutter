import 'dart:io';

import 'package:english_lettutor_app/ui/screen/become_teacher/components/step/step1/components/basic_infor.dart';
import 'package:english_lettutor_app/ui/screen/become_teacher/components/step/step1/components/cv_teacher.dart';
import 'package:english_lettutor_app/ui/screen/become_teacher/components/step/step1/components/subtitile_step1.dart';
import 'package:english_lettutor_app/ui/screen/become_teacher/components/step/step1/components/teaching_infor.dart';
import 'package:flutter/material.dart';

class Step1Page extends StatefulWidget {
  const Step1Page({Key? key}) : super(key: key);

  @override
  _Step1PageState createState() => _Step1PageState();
}

class _Step1PageState extends State<Step1Page> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        SubtitleStep1(),
        //Basic info
        BasicInfor(),
        SizedBox(height: 10),
        //CV
        CVTeacher(),

        TeachingInfor(),
      ],
    );
  }
}
