import 'package:english_lettutor_app/ui/screen/home/page/home_page.dart';
import 'package:english_lettutor_app/ui/widget/item_view/avatar/circle_avatar_button.dart';
import 'package:english_lettutor_app/ui/widget/item_view/my_bottom_bar.dart';
import 'package:english_lettutor_app/utilities/constants/constants.dart';
import 'package:english_lettutor_app/utilities/constants/styles.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  static var routeName = "/home_screen";

  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          foregroundColor: kMainBlueColor,
          leading: IconButton(
            alignment: AlignmentDirectional.center,
            icon: Expanded(
              child: Image.asset('assets/images/large_logo.png'),
            ),
            onPressed: () {
              setState(() {});
            },
          ),
          actions: const [
            CircleAvatarButton(
              image: null,
              onPressed: null,
              radius: 15,
            )
          ],
          title: const Center(child: Text("Home", style: pageNameStyle))),
      body: const HomePage(),
      bottomNavigationBar: MyBottomNavigation(
          index: _currentPage,
          onTap: (index) {
            setState(() {
              _currentPage = index;
            });
          }),
    );
  }
}
