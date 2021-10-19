import 'package:english_lettutor_app/ui/screen/home/page/home_page/components/list_recommended_teacher.dart';
import 'package:english_lettutor_app/ui/screen/home/page/home_page/components/list_your_teacher.dart';
import 'package:english_lettutor_app/ui/screen/home/page/home_page/components/title_and_button.dart';
import 'package:english_lettutor_app/ui/screen/home/page/home_page/components/welcome_with_search.dart';
import 'package:english_lettutor_app/utilities/constants/constants.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // int columnRatio = getColumnRatio(size);
    return SingleChildScrollView(
      child: Column(
        children: [
          // welcome
          WelcomeWithSearch(size: size),
          //your teacher
          const TitleAndButton(
            title: "Your Teacher",
            textButton: "More",
          ),
          //listView
          const ListYourTeacher(),
          // see all
          const TitleAndButton(
            title: "Recommended Teacher",
            textButton: "More",
          ),
          //gridview
          const ListRecommendedTeacher(),
          // const NoDataPage(),
        ],
      ),
    );
  }

  int getColumnRatio(Size size) {
    int columnRatio = 12;
    if (size.width <= kMobileBreakpoint) {
      columnRatio = 12;
    } else if (size.width > kMobileBreakpoint &&
        size.width <= kTabletBreakpoint) {
      columnRatio = 6;
    } else if (size.width > kTabletBreakpoint &&
        size.width <= kDesktopBreakPoint) {
      columnRatio = 4;
    } else {
      columnRatio = 3;
    }
    return columnRatio;
  }
}
