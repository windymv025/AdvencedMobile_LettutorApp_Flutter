import 'package:english_lettutor_app/ui/screen/home/page/home_page/components/title_and_button.dart';
import 'package:english_lettutor_app/ui/screen/home/page/home_page/components/welcome_with_search.dart';
import 'package:flutter/material.dart';

import 'components/list_recommended_teacher.dart';
import 'components/recommended_courses.dart';

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
            onPressed: () {},
            title: "Recommended Course",
            textButton: "More",
          ),
          //listView
          const RecommendedCourse(),
          // see all
          TitleAndButton(
            onPressed: () {},
            title: "Recommended Teacher",
            textButton: "More",
          ),
          // // const NoDataPage(),
        ])),
        //gridview
        ListRecommendedTeacher(
          size: size,
        ),
      ],
    );
  }
}
