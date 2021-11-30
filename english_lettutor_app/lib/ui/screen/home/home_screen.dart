import 'package:english_lettutor_app/constants/enums.dart';
import 'package:english_lettutor_app/data/local_data_test.dart';
import 'package:english_lettutor_app/data/provider/course_dto.dart';
import 'package:english_lettutor_app/data/provider/schedule_dto.dart';
import 'package:english_lettutor_app/data/provider/teacher_dto.dart';
import 'package:english_lettutor_app/models/profile/profile.dart';
import 'package:english_lettutor_app/ui/drawer/my_drawer.dart';
import 'package:english_lettutor_app/ui/widget/item_view/bar/custom_app_bar.dart';
import 'package:english_lettutor_app/ui/widget/item_view/bar/my_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/src/provider.dart';

import 'home_page/home_page.dart';

class HomeScreen extends StatefulWidget {
  static var routeName = "/home_screen";

  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TeacherDTO teacherDTO = TeacherDTO();
  final CourseDTO courseDTO = CourseDTO();
  final ScheduleDTO scheduleDTO = ScheduleDTO();

  @override
  void initState() {
    super.initState();
    teacherDTO.addAll(teacherList);
    courseDTO.addAll(courseList);
    scheduleDTO.addAll(scheduleList);
  }

  @override
  Widget build(BuildContext context) {
    // final Profile profile = context.watch<Profile>();

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => teacherDTO),
        ChangeNotifierProvider(create: (context) => courseDTO),
        ChangeNotifierProvider(create: (context) => scheduleDTO),
      ],
      child: Consumer<Profile>(builder: (context, Profile profile, _) {
        return Scaffold(
            appBar: CustomAppBar(
                title: "Home",
                imageAvatar:
                    profile.image == null ? null : AssetImage(profile.image!)),
            drawer: const MyDrawer(),
            body: const HomePage(),
            bottomNavigationBar: const MyBottomNavigation(
              selectedMenu: MenuState.home,
            ));
      }),
    );
  }
}
