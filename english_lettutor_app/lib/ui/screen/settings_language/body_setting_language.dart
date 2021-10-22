import 'package:english_lettutor_app/ui/screen/profile/components/custom_drop_down.dart';
import 'package:flutter/material.dart';

class BodySettingLanguage extends StatefulWidget {
  const BodySettingLanguage({Key? key}) : super(key: key);

  @override
  _BodySettingLanguageState createState() => _BodySettingLanguageState();
}

class _BodySettingLanguageState extends State<BodySettingLanguage> {
  String value = "English";
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CustomDropDown(
          onChanged: (newValue) {
            setState(() {
              value = newValue!;
            });
          },
          value: value,
          title: "Language",
          items: const ["English", "Tiếng Việt"],
          icon: Icons.flag_rounded),
    );
  }
}
