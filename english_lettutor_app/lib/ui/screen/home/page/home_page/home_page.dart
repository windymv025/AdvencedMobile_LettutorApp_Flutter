import 'package:english_lettutor_app/ui/screen/home/page/home_page/components/list_your_teacher.dart';
import 'package:english_lettutor_app/ui/screen/home/page/home_page/components/title_and_button.dart';
import 'package:english_lettutor_app/ui/screen/home/page/home_page/components/welcome_with_search.dart';
import 'package:flutter/material.dart';

import 'components/list_recommended_teacher.dart';

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
