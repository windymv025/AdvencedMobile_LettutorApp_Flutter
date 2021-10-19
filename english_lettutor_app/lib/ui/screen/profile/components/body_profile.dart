import 'package:english_lettutor_app/ui/screen/profile/components/profile_form.dart';
import 'package:english_lettutor_app/ui/screen/sign_up/components/sign_up_form.dart';
import 'package:english_lettutor_app/ui/widget/item_view/custom_suffix_icon.dart';
import 'package:english_lettutor_app/utilities/constants/assets.dart';
import 'package:flutter/material.dart';

import '../profile_screen.dart';
import 'infor.dart';

class BodyProfile extends StatelessWidget {
  const BodyProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String? fullName;

    return ListView(children: [
      Infor(
          onTap: () => Navigator.pushNamed(context, ProfileScreen.routeName),
          defaultSize: 10,
          name: "Pham Minh Vuong",
          email: "windymv@gmail.com",
          image: Assets.assetsImagesUserIcon),
      const SizedBox(
        height: 25,
      ),
      Padding(
        child: ProfileForm(),
        padding: const EdgeInsets.symmetric(horizontal: 20),
      ),
    ]);
  }
}
