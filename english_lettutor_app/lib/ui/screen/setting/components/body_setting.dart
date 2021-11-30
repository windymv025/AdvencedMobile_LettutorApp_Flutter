import 'package:english_lettutor_app/constants/constants.dart';
import 'package:english_lettutor_app/ui/drawer/components/setting_dropdown_button.dart';
import 'package:english_lettutor_app/ui/drawer/components/settings_button.dart';
import 'package:flutter/material.dart';

class BodySetting extends StatefulWidget {
  const BodySetting({Key? key}) : super(key: key);

  @override
  _BodySettingState createState() => _BodySettingState();
}

class _BodySettingState extends State<BodySetting> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        SettingsButton(
            onPress: null,
            icon: Icon(
              Icons.language_rounded,
              color: kMainBlueColor,
            ),
            title: "Language",
            child: SettingLanguageDropdownButton()),
        SettingsButton(
            onPress: null,
            icon: Icon(
              Icons.light_sharp,
              color: kMainBlueColor,
            ),
            title: "Theme",
            child: SettingThemeDropdownButton()),
      ],
    );
  }
}
