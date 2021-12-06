import 'package:english_lettutor_app/constants/assets.dart';
import 'package:english_lettutor_app/data/provider/home_state.dart';
import 'package:english_lettutor_app/ui/screen/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'components/lesson_body.dart';

class LessonScreen extends StatelessWidget {
  static String routeName = "/lesson";
  const LessonScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeState>(builder: (context, homeState, child) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          leading: IconButton(
              onPressed: () => Navigator.of(context).pop(),
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.white,
              )),
        ),
        body: const LessonBody(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            homeState.pageIndex = 0;
            Navigator.of(context).pushNamed(HomeScreen.routeName);
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(Assets.assetsImagesLargeLogo),
          ),
          backgroundColor: Colors.white,
        ),
      );
    });
  }
}
