import 'package:english_lettutor_app/ui/drawer/my_drawer.dart';
import 'package:english_lettutor_app/ui/screen/home/components/custom_app_bar.dart';
import 'package:english_lettutor_app/ui/screen/teachers/components/teacher_page.dart';
import 'package:english_lettutor_app/ui/widget/item_view/my_bottom_bar.dart';
import 'package:english_lettutor_app/utilities/constants/enums.dart';
import 'package:flutter/material.dart';

class TeachersScreen extends StatelessWidget {
  static String routeName = "/teacher_screen";
  const TeachersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: "Teacher", imageAvatar: null),
      body: TeacherPage(),
      drawer: MyDrawer(),
      bottomNavigationBar: MyBottomNavigation(selectedMenu: MenuState.teacher),
    );
  }
}