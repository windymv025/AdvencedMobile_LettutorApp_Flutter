import 'package:english_lettutor_app/ui/screen/home/home_screen.dart';
import 'package:english_lettutor_app/ui/screen/profile/profile_screen.dart';
import 'package:english_lettutor_app/ui/widget/item_view/avatar/circle_avatar_button.dart';
import 'package:english_lettutor_app/utilities/constants/constants.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({Key? key, required this.title, required this.imageAvatar})
      : super(key: key);
  final String title;
  final ImageProvider? imageAvatar;

  @override
  Widget build(BuildContext context) {
    return AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: kMainBlueColor,
        leading: Builder(builder: (context) {
          return IconButton(
            alignment: AlignmentDirectional.center,
            icon: Expanded(
              child: Image.asset('assets/images/large_logo.png'),
            ),
            onPressed: () {
              // Navigator.pushNamed(context, HomeScreen.routeName);
              Scaffold.of(context).openDrawer();
            },
            tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
          );
        }),
        actions: [
          CircleAvatarButton(
            image: imageAvatar,
            onPressed: () =>
                Navigator.pushNamed(context, ProfileScreen.routeName),
            radius: 15,
          )
        ],
        title: Text(title));
  }

  @override
  Size get preferredSize => AppBar().preferredSize;
}
