import 'package:english_lettutor_app/ui/screen/courses/courses_screen.dart';
import 'package:english_lettutor_app/ui/screen/teachers/teachers_screen.dart';
import 'package:flutter/material.dart';

import 'components/list_recommended_teacher.dart';
import 'components/recommended_courses.dart';
import 'components/title_and_button.dart';
import 'components/welcome_with_search.dart';

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
    return CustomScrollView(
      slivers: [
        SliverList(
            delegate: SliverChildListDelegate([
          // welcome
          WelcomeWithSearch(size: size),
          //your teacher
          TitleAndButton(
            onPressed: () {
              Navigator.pushNamed(context, CoursesScreen.routeName);
            },
            title: "Recommended Course",
            textButton: "More",
          ),
          //listView
          const RecommendedCourse(),
          // see all
          TitleAndButton(
            onPressed: () {
              Navigator.pushNamed(context, TeachersScreen.routeName);
            },
            title: "Recommended Teacher",
            textButton: "More",
          ),
          // const NoDataPage(),
        ])),
        //gridview
        ListRecommendedTeacher(
          size: size,
        ),
      ],
    );
  }
}
