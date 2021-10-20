import 'package:english_lettutor_app/ui/drawer/my_drawer.dart';
import 'package:english_lettutor_app/ui/screen/home/components/custom_app_bar.dart';
import 'package:english_lettutor_app/ui/widget/item_view/my_bottom_bar.dart';
import 'package:english_lettutor_app/utilities/constants/enums.dart';
import 'package:flutter/material.dart';

import 'components/courses_body.dart';

class CoursesScreen extends StatelessWidget {
  static String routeName = "/coures_screen";
  const CoursesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: "Courses", imageAvatar: null),
      body: CoursesBody(),
      drawer: MyDrawer(),
      bottomNavigationBar: MyBottomNavigation(selectedMenu: MenuState.course),
    );
  }
}
