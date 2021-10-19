import 'package:english_lettutor_app/ui/screen/home/components/custom_app_bar.dart';
import 'package:english_lettutor_app/ui/screen/home/page/home_page/home_page.dart';
import 'package:english_lettutor_app/ui/screen/home/page/teacher_page/teacher_page.dart';
import 'package:english_lettutor_app/ui/widget/item_view/my_bottom_bar.dart';
import 'package:english_lettutor_app/utilities/constants/enums.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  static var routeName = "/home_screen";

  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static const titles = [
    "Home",
    "Messenger",
    "Upcoming",
    "Teacher",
    "Settings"
  ];

  // static const Widget homePage = HomePage();

  int _currentPage = 0;
  bool _visible = true;
  String _namePage = titles[0];

  Widget page = const HomePage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          _visible ? CustomAppBar(title: _namePage, imageAvatar: null) : null,
      body: page,
      bottomNavigationBar: MyBottomNavigation(
          selectedMenu: MenuState.home,
          onTap: (index) {
            setState(() {
              _currentPage = index;

              switch (index) {
                case 0:
                  page = const HomePage();
                  break;
                case 1:
                  break;
                case 2:
                  break;
                case 3:
                  page = const TeacherPage();
                  break;
                case 4:
                  break;
                default:
              }

              if (index == MenuState.settings.index) {
                _visible = false;
              } else {
                _namePage = titles[index];
                _visible = true;
              }
            });
          }),
    );
  }
}
