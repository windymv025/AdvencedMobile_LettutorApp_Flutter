import 'package:english_lettutor_app/ui/screen/profile/components/infor.dart';
import 'package:english_lettutor_app/ui/screen/profile/profile_screen.dart';
import 'package:english_lettutor_app/ui/screen/sign_in/sign_in_screen.dart';
import 'package:english_lettutor_app/utilities/constants/assets.dart';
import 'package:english_lettutor_app/utilities/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'settings_button.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return Container();
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            color: kMainBlueColor,
            height: 5,
          ),
          Infor(
              onTap: () =>
                  Navigator.popAndPushNamed(context, ProfileScreen.routeName),
              defaultSize: 10,
              name: "Pham Minh Vuong",
              email: "windymv@gmail.com",
              image: Assets.assetsImagesUserIcon),
          const SizedBox(
            height: 25,
          ),
          SettingsButton(
              onPress: () {},
              icon: const Icon(
                Icons.history_edu_rounded,
                color: kMainBlueColor,
              ),
              title: "Schedule history"),
          SettingsButton(
              onPress: () {},
              icon: SvgPicture.asset(
                Assets.assetsIconsTeacher,
                color: kMainBlueColor,
                height: 24,
                width: 18,
              ),
              title: "Become a teacher"),
          SettingsButton(
              onPress: () {},
              icon: const Icon(
                Icons.language_rounded,
                color: kMainBlueColor,
              ),
              title: "Language"),
          SettingsButton(
              onPress: () {
                Navigator.restorablePopAndPushNamed(
                    context, SignInScreen.routeName);
              },
              icon: const Icon(
                Icons.logout_rounded,
                color: kMainBlueColor,
              ),
              title: "Logout")
        ],
      ),
    );
  }
}
