import 'package:english_lettutor_app/constants/enums.dart';
import 'package:english_lettutor_app/ui/drawer/my_drawer.dart';
import 'package:english_lettutor_app/ui/screen/messenger/components/messenger_body.dart';
import 'package:english_lettutor_app/ui/widget/item_view/bar/custom_app_bar.dart';
import 'package:english_lettutor_app/ui/widget/item_view/bar/my_bottom_bar.dart';
import 'package:flutter/material.dart';

class MessengerScreen extends StatelessWidget {
  static String routeName = "/messenger";
  const MessengerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: "Messenger"),
      drawer: MyDrawer(),
      body: MessengerBody(),
      bottomNavigationBar:
          MyBottomNavigation(selectedMenu: MenuState.messenger),
    );
  }
}
