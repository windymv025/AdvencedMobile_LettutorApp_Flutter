import 'package:english_lettutor_app/models/teacher/teacher.dart';
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
    Teacher teacher = ModalRoute.of(context)?.settings.arguments as Teacher;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 16),
        child: Stack(
          children: [
            TeacherDetailBody(
              teacher: teacher,
            ),
            Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.grey,
                    ),
                    onPressed: () => Navigator.of(context).pop())),
          ],
        ),
      ),
    );
  }
}
