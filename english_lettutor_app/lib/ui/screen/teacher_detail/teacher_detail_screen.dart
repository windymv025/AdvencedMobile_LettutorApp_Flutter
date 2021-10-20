import 'package:english_lettutor_app/ui/screen/teacher_detail/components/teacher_detail_body.dart';
import 'package:flutter/material.dart';

class TeacherDetailScreen extends StatefulWidget {
  static String routeName = "/teacher_detail";
  const TeacherDetailScreen({Key? key}) : super(key: key);

  @override
  _TeacherDetailScreenState createState() => _TeacherDetailScreenState();
}

class _TeacherDetailScreenState extends State<TeacherDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const TeacherDetailBody(),
    );
  }
}
