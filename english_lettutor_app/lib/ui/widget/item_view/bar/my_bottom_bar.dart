import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:english_lettutor_app/constants/constants.dart';
import 'package:english_lettutor_app/constants/enums.dart';
import 'package:english_lettutor_app/ui/screen/courses/courses_screen.dart';
import 'package:english_lettutor_app/ui/screen/home/home_screen.dart';
import 'package:english_lettutor_app/ui/screen/messenger/messenger_screen.dart';
import 'package:english_lettutor_app/ui/screen/schedule/schedule_screen.dart';
import 'package:english_lettutor_app/ui/screen/teachers/teachers_screen.dart';
import 'package:flutter/material.dart';

class MyBottomNavigation extends StatefulWidget {
  const MyBottomNavigation({Key? key, required this.selectedMenu})
      : super(key: key);
  final MenuState selectedMenu;
  @override
  _MyBottomNavigationState createState() => _MyBottomNavigationState();
}

class _MyBottomNavigationState extends State<MyBottomNavigation> {
  bool _isDark = false;
  @override
  Widget build(BuildContext context) {
    _isDark = Theme.of(context).brightness == Brightness.dark;
    return CurvedNavigationBar(
      index: widget.selectedMenu.index,
      height: 64,
      color: _isDark ? kDarkColor : kMainBlueColor,
      backgroundColor:
          _isDark ? Colors.grey.withOpacity(0.1) : Colors.white.withOpacity(0),
      onTap: (index) {
        switch (index) {
          case 0:
            Navigator.pushNamed(context, HomeScreen.routeName);
            break;
          case 1:
            Navigator.pushNamed(context, MessengerScreen.routeName);
            break;
          case 2:
            Navigator.pushNamed(context, ScheduleScreen.routeName);
            break;
          case 3:
            Navigator.pushNamed(context, TeachersScreen.routeName);
            break;
          case 4:
            Navigator.pushNamed(context, CoursesScreen.routeName);
            break;
          default:
        }
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
    );
  }
}
