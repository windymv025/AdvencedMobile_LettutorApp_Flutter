import 'package:english_lettutor_app/data/provider/home_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
    return Consumer<HomeState>(builder: (context, homeState, _) {
      return CustomScrollView(
        slivers: [
          SliverList(
              delegate: SliverChildListDelegate([
            // welcome
            WelcomeWithSearch(size: size),
            //your teacher
            TitleAndButton(
              onPressed: () {
                // Navigator.pushNamed(context, CoursesScreen.routeName);
                homeState.pageIndex = 4;
              },
              title: "Recommended Course",
              textButton: "More",
            ),
            //listView
            const RecommendedCourse(),
            // see all
            TitleAndButton(
              onPressed: () {
                // Navigator.pushNamed(context, TeachersScreen.routeName);
                homeState.pageIndex = 3;
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
    });
  }
}
