import 'package:flutter/material.dart';

class MyBottomNavigation extends StatefulWidget {
  const MyBottomNavigation({Key? key, required this.index, required this.onTap}) : super(key: key);
  final int index;
  final ValueChanged<int>? onTap;
  @override
  _MyBottomNavigationState createState() => _MyBottomNavigationState();
}

class _MyBottomNavigationState extends State<MyBottomNavigation> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: widget.index,
      fixedColor: Colors.blueAccent,
      selectedFontSize: 12,
      unselectedFontSize: 10,
      type: BottomNavigationBarType.fixed,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_rounded),
          label: "Home",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.message_rounded),
          label: "Message",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.av_timer_rounded),
          label: "Upcoming",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.book_rounded),
          label: "Tutors",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: "Settings",
        ),
      ],
      onTap: widget.onTap,
    );
  }
}
