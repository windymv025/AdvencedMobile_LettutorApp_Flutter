import 'package:english_lettutor_app/constants/design/styles.dart';
import 'package:english_lettutor_app/ui/screen/settings_language/body_setting_language.dart';
import 'package:flutter/material.dart';

class SettingLanguageScreen extends StatelessWidget {
  static String routeName = "/setting_language";
  const SettingLanguageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Setting language",
          style: pageNameStyle,
        ),
      ),
      body: const BodySettingLanguage(),
    );
  }
}
