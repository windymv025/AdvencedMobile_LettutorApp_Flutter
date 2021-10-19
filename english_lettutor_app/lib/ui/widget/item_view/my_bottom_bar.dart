import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:english_lettutor_app/utilities/constants/constants.dart';
import 'package:english_lettutor_app/utilities/constants/enums.dart';
import 'package:flutter/material.dart';

class MyBottomNavigation extends StatefulWidget {
  const MyBottomNavigation(
      {Key? key, required this.selectedMenu, required this.onTap})
      : super(key: key);
  final MenuState selectedMenu;
  final ValueChanged<int>? onTap;
  @override
  _MyBottomNavigationState createState() => _MyBottomNavigationState();
}

class _MyBottomNavigationState extends State<MyBottomNavigation> {
  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      index: widget.selectedMenu.index,
      height: 64,
      color: kMainBlueColor,
      backgroundColor: Colors.white,
      onTap: widget.onTap,
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
          Icons.access_time_filled_rounded,
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

// class _MyBottomNavigationState_v1 extends State<MyBottomNavigation> {
//   @override
//   Widget build(BuildContext context) {
//     return BottomNavigationBar(
//       currentIndex: widget.selectedMenu.index,
//       fixedColor: Colors.blueAccent,
//       selectedFontSize: 12,
//       unselectedFontSize: 10,
//       type: BottomNavigationBarType.fixed,
//       items: const [
//         BottomNavigationBarItem(
//           icon: Icon(Icons.home_rounded),
//           label: "Home",
//         ),
//         BottomNavigationBarItem(
//           icon: Icon(Icons.message_rounded),
//           label: "Message",
//         ),
//         BottomNavigationBarItem(
//           icon: Icon(Icons.av_timer_rounded),
//           label: "Upcoming",
//         ),
//         BottomNavigationBarItem(
//           icon: Icon(Icons.book_rounded),
//           label: "Tutors",
//         ),
//         BottomNavigationBarItem(
//           icon: Icon(Icons.settings),
//           label: "Settings",
//         ),
//       ],
//       onTap: widget.onTap,
//     );
//   }
// }
