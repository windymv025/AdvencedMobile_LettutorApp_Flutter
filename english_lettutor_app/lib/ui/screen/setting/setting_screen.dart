import 'package:english_lettutor_app/constants/design/styles.dart';
import 'package:flutter/material.dart';

import 'components/body_setting.dart';

class SettingScreen extends StatelessWidget {
  static String routeName = "/setting_screen";
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Setting",
          style: pageNameStyle,
        ),
      ),
      body: const BodySetting(),
    );
  }
}
