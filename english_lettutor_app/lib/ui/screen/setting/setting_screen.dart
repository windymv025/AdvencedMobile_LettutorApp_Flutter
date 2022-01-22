import 'package:english_lettutor_app/constants/design/styles.dart';
import 'package:english_lettutor_app/generated/l10n.dart';
import 'package:flutter/material.dart';

import 'components/body_setting.dart';

class SettingScreen extends StatelessWidget {
  static String routeName = "/setting_screen";
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          S.of(context).setting,
          style: pageNameStyle,
        ),
      ),
      body: const BodySetting(),
    );
  }
}
