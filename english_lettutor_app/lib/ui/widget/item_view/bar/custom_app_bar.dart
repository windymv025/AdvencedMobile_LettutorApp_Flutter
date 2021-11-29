import 'package:english_lettutor_app/constants/constants.dart';
import 'package:english_lettutor_app/ui/screen/profile/profile_screen.dart';
import 'package:english_lettutor_app/ui/widget/item_view/button/circle_avatar_button.dart';
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
            icon: Image.asset('assets/images/large_logo.png'),
            onPressed: () {
              // Navigator.pushNamed(context, HomeScreen.routeName);
              Scaffold.of(context).openDrawer();
            },
            tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
          );
        }),
        actions: [
          Center(
            child: CircleAvatarButton(
              image: imageAvatar,
              onPressed: () =>
                  Navigator.pushNamed(context, ProfileScreen.routeName),
            ),
          )
        ],
        title: Text(title));
  }

  @override
  Size get preferredSize => AppBar().preferredSize;
}
