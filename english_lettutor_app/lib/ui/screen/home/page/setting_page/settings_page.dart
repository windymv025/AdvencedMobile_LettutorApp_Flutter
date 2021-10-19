import 'package:english_lettutor_app/ui/screen/home/page/setting_page/components/infor.dart';
import 'package:english_lettutor_app/utilities/constants/assets.dart';
import 'package:english_lettutor_app/utilities/constants/constants.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: const [
          Info(
              name: "Pham Minh Vuong",
              email: "Windymv025@gmail.com",
              image: Assets.assetsImagesUserIcon)
        ],
      ),
    );
  }
}
