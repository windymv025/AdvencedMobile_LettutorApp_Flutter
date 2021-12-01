import 'package:english_lettutor_app/constants/enums.dart';
import 'package:english_lettutor_app/ui/drawer/my_drawer.dart';
import 'package:english_lettutor_app/ui/widget/item_view/bar/custom_app_bar.dart';
import 'package:english_lettutor_app/ui/widget/item_view/bar/my_bottom_bar.dart';
import 'package:flutter/material.dart';

import 'home_page/home_page.dart';

class HomeScreen extends StatefulWidget {
  static var routeName = "/home_screen";

  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        appBar: CustomAppBar(
          title: "Home",
        ),
        drawer: MyDrawer(),
        body: HomePage(),
        bottomNavigationBar: MyBottomNavigation(
          selectedMenu: MenuState.home,
        ));
  }
}
