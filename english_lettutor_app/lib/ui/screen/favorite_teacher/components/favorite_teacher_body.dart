import 'package:english_lettutor_app/data/provider/teacher_dto.dart';
import 'package:english_lettutor_app/ui/screen/home/home_page/components/custom_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoriteTeacherBody extends StatefulWidget {
  const FavoriteTeacherBody({Key? key}) : super(key: key);

  @override
  _FavoriteTeacherBodyState createState() => _FavoriteTeacherBodyState();
}

class _FavoriteTeacherBodyState extends State<FavoriteTeacherBody> {
  @override
  Widget build(BuildContext context) {
    final TeacherDTO teacherDTO =
        Provider.of<TeacherDTO>(context, listen: true);
    Size size = MediaQuery.of(context).size;
    return RefreshIndicator(
      onRefresh: () async {
        teacherDTO.init();
      },
      child: CustomScrollView(
        slivers: [
          CustomGridView(
            size: size,
            items: teacherDTO.getFavoriteTeachers(),
          ),
        ],
      ),
    );
  }
}
