import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:english_lettutor_app/constants/constants.dart';
import 'package:english_lettutor_app/data/provider/course_dto.dart';
import 'package:english_lettutor_app/data/provider/home_state.dart';
import 'package:english_lettutor_app/data/provider/teacher_dto.dart';
import 'package:english_lettutor_app/ui/drawer/my_drawer.dart';
import 'package:english_lettutor_app/ui/screen/home/messenger_page/messenger_body.dart';
import 'package:english_lettutor_app/ui/widget/item_view/bar/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'courses_page/courses_body.dart';
import 'home_page/home_page.dart';
import 'schedule_page/schedule_body.dart';
import 'teacher_page/teacher_page.dart';

class HomeScreen extends StatefulWidget {
  static var routeName = "/home_screen";

  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static final Map<int, Widget> _children = {
    0: const HomePage(),
  };

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    bool _isDark = Theme.of(context).brightness == Brightness.dark;
    HomeState homeState = Provider.of<HomeState>(context);
    TeacherDTO teacherDTO = Provider.of<TeacherDTO>(context);
    CourseDTO courseDTO = Provider.of<CourseDTO>(context);

    return Scaffold(
      appBar: CustomAppBar(
        title: homeState.titles[homeState.pageIndex],
      ),
      drawer: const MyDrawer(),
      body: getPage(homeState.pageIndex),
      bottomNavigationBar: CurvedNavigationBar(
        index: homeState.pageIndex,
        height: 64,
        color: _isDark ? kDarkColor : kMainBlueColor,
        backgroundColor: _isDark
            ? Colors.grey.withOpacity(0.1)
            : Colors.transparent.withOpacity(0),
        onTap: (index) {
          loadPage(index);
          homeState.pageIndex = index;
          teacherDTO.clearSpecialities();
          courseDTO.clearSearch();
        },
        items: const [
          Icon(
            Icons.home_rounded,
            size: 30,
            color: Colors.white,
          ),
          Icon(
            Icons.message_rounded,
            size: 30,
            color: Colors.white,
          ),
          Icon(
            Icons.schedule_rounded,
            size: 30,
            color: Colors.white,
          ),
          Icon(
            Icons.people_alt_rounded,
            size: 30,
            color: Colors.white,
          ),
          Icon(
            Icons.book_rounded,
            size: 30,
            color: Colors.white,
          ),
        ],
      ),
    );
  }

  void loadPage(int index) {
    setState(() {
      if (_children[index] == null) {
        switch (index) {
          case 1:
            _children[1] = const MessengerBody();
            break;
          case 2:
            _children[2] = const ScheduleBody();
            break;
          case 3:
            _children[3] = const TeacherPage();
            break;
          case 4:
            _children[4] = const CoursesBody();
            break;
          default:
            break;
        }
      }
    });
  }

  Widget getPage(int index) {
    loadPage(index);
    return _children[index]!;
  }
}
