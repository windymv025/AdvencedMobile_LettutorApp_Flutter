import 'package:english_lettutor_app/ui/screen/profile/components/infor_and_change_image.dart';
import 'package:english_lettutor_app/ui/screen/profile/components/profile_form.dart';
import 'package:english_lettutor_app/utilities/constants/assets.dart';
import 'package:flutter/material.dart';

class BodyProfile extends StatelessWidget {
  const BodyProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      InforAndChangeImage(
          onTap: () {},
          email: "windymv@gmail.com",
          name: "Pham Minh Vuong",
          image: Assets.assetsImagesCloudData),
      const SizedBox(
        height: 25,
      ),
      const Padding(
        child: ProfileForm(),
        padding: EdgeInsets.symmetric(horizontal: 20),
      ),
    ]);
  }
}
