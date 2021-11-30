import 'package:english_lettutor_app/data/provider/teacher_dto.dart';
import 'package:english_lettutor_app/models/teacher/teacher.dart';
import 'package:english_lettutor_app/ui/screen/home/home_page/components/custom_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListRecommendedTeacher extends StatefulWidget {
  const ListRecommendedTeacher({Key? key, required this.size})
      : super(key: key);
  final Size size;

  @override
  _ListRecommendedTeacherState createState() => _ListRecommendedTeacherState();
}

class _ListRecommendedTeacherState extends State<ListRecommendedTeacher> {
  List<Teacher> teachers = [];

  @override
  Widget build(BuildContext context) {
    final TeacherDTO teacherDTO = context.watch<TeacherDTO>();
    teachers = teacherDTO.getRecommendedTeachers();
    return CustomGridView(
      items: teachers,
      size: widget.size,
    );
  }
}
