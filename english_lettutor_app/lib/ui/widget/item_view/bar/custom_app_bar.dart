import 'package:english_lettutor_app/constants/assets.dart';
import 'package:english_lettutor_app/constants/constants.dart';
import 'package:english_lettutor_app/data/provider/profile_provider.dart';
import 'package:english_lettutor_app/ui/screen/profile/profile_screen.dart';
import 'package:english_lettutor_app/ui/widget/item_view/button/circle_avatar_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Consumer<ProfileProvider>(builder: (context, profile, child) {
      return AppBar(
          centerTitle: true,
          foregroundColor: kMainBlueColor,
          leading: Builder(builder: (context) {
            return IconButton(
              alignment: AlignmentDirectional.center,
              icon: Image.asset(Assets.assetsImagesLargeLogo),
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
                image: getImage(profile),
                onPressed: () =>
                    Navigator.pushNamed(context, ProfileScreen.routeName),
              ),
            )
          ],
          title: Text(title));
    });
  }

  @override
  Size get preferredSize => AppBar().preferredSize;

  ImageProvider? getImage(ProfileProvider profile) {
    try {
      if (profile.imageFile != null) {
        return FileImage(profile.imageFile!);
      } else if (profile.image != null) {
        return NetworkImage(profile.image!);
      }
    } catch (e) {
      print(e);
    }
    return null;
  }
}
