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

  static Map<int, Widget> dictionaryPage = {0: const HomePage()};

  // static const Widget homePage = HomePage();

  bool _visible = true;
  String _namePage = titles[0];

  Widget page = dictionaryPage[0] ?? const HomePage();

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
              if (!dictionaryPage.containsKey(index)) {
                switch (index) {
                  case 0:
                    dictionaryPage[index] = const HomePage();
                    page = dictionaryPage[index]!;
                    break;
                  case 1:
                    // dictionaryPage[index] = const HomePage();
                    break;
                  case 2:
                    // dictionaryPage[index] = const HomePage();
                    break;
                  case 3:
                    dictionaryPage[index] = const TeacherPage();
                    page = dictionaryPage[index]!;
                    break;
                  case 4:
                    // dictionaryPage[index] = const HomePage();
                    break;
                  default:
                }
              } else {
                page = dictionaryPage[index]!;
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
