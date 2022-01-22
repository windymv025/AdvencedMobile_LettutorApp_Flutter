import 'package:english_lettutor_app/constants/assets.dart';
import 'package:english_lettutor_app/constants/constants.dart';
import 'package:english_lettutor_app/data/provider/language_profile.dart';
import 'package:english_lettutor_app/generated/l10n.dart';
import 'package:english_lettutor_app/models/Theme/theme_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class SettingLanguageDropdownButton extends StatefulWidget {
  const SettingLanguageDropdownButton({
    Key? key,
  }) : super(key: key);

  @override
  _SettingLanguageDropdownButtonState createState() =>
      _SettingLanguageDropdownButtonState();
}

class _SettingLanguageDropdownButtonState
    extends State<SettingLanguageDropdownButton> {
  String _selectedLanguage = 'English';

  @override
  Widget build(BuildContext context) {
    final LanguageProfile languageProfile =
        Provider.of<LanguageProfile>(context);

    if (languageProfile.languageCode == LanguageProfile.codeEN) {
      _selectedLanguage = 'English';
    } else {
      _selectedLanguage = "Tiếng Việt";
    }
    return DropdownButton(
      alignment: Alignment.centerRight,
      icon: Container(),
      value: _selectedLanguage,
      onChanged: (value) {
        setState(() {
          _selectedLanguage = value as String;
          if (value == 'English') {
            languageProfile.changeLanguage(LanguageProfile.codeEN);
          } else if (value == "Tiếng Việt") {
            languageProfile.changeLanguage(LanguageProfile.codeVN);
          }
          S.delegate.load(languageProfile.locale);
        });
      },
      underline: Container(),
      items: ["English", "Tiếng Việt"]
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Row(
            children: [
              SvgPicture.asset(
                value == "English"
                    ? Assets.assetsIconsUk
                    : Assets.assetsIconsVn,
                width: 17,
              ),
              const SizedBox(
                width: 8,
              ),
              Text(
                value,
                style: const TextStyle(fontSize: 14),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}

class SettingThemeDropdownButton extends StatefulWidget {
  const SettingThemeDropdownButton({Key? key}) : super(key: key);

  @override
  _SettingThemeDropdownButtonState createState() =>
      _SettingThemeDropdownButtonState();
}

class _SettingThemeDropdownButtonState
    extends State<SettingThemeDropdownButton> {
  String _selectedTheme = kStringLightTheme;

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeModel>(builder: (context, themeModel, child) {
      _selectedTheme = themeModel.typeName;
      return DropdownButton(
        icon: Container(),
        underline: Container(),
        value: _selectedTheme,
        onChanged: (value) {
          setState(() {
            _selectedTheme = value as String;
            if (value == kStringLightTheme) {
              themeModel.setThemeLight();
            } else if (value == kStringDarkTheme) {
              themeModel.setThemeDark();
            }
          });
        },
        items: kThemes.map<DropdownMenuItem<String>>((String value) {
          bool _isLight = value == kStringLightTheme;
          IconData _icon =
              _isLight ? Icons.wb_sunny_rounded : Icons.brightness_2;
          return DropdownMenuItem<String>(
            value: value,
            child: Row(
              children: [
                Icon(
                  _icon,
                  color: _isLight ? Colors.yellow : Colors.black,
                  size: 18,
                ),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  value,
                  style: const TextStyle(fontSize: 14),
                ),
              ],
            ),
          );
        }).toList(),
      );
    });
  }
}
