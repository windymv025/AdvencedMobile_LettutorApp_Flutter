import 'package:english_lettutor_app/ui/drawer/my_drawer.dart';
import 'package:english_lettutor_app/ui/screen/home/components/custom_app_bar.dart';
import 'package:english_lettutor_app/ui/widget/item_view/bar/my_bottom_bar.dart';
import 'package:english_lettutor_app/utilities/constants/enums.dart';
import 'package:flutter/material.dart';

import 'components/schedule_body.dart';

class ScheduleScreen extends StatelessWidget {
  static String routeName = "/schedule";
  const ScheduleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: "Schedule", imageAvatar: null),
      body: ScheduleBody(),
      bottomNavigationBar: MyBottomNavigation(selectedMenu: MenuState.schedule),
      drawer: MyDrawer(),
    );
  }
}
