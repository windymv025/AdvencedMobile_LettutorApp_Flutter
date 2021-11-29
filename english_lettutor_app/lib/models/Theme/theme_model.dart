import 'package:english_lettutor_app/constants/constants.dart';
import 'package:english_lettutor_app/constants/design/theme.dart';
import 'package:english_lettutor_app/data/sharedpref/shared_preference_helper.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeModel extends ChangeNotifier {
  SharedPreferenceHelper? _prefHelper;

  ThemeData _themeMode = themeData;
  String typeName = kStringLightTheme;
  ThemeModel() {
    _loadTheme();
  }

  void _loadTheme() async {
    var prefs = await SharedPreferences.getInstance();
    _prefHelper = SharedPreferenceHelper(prefs);

    if (_prefHelper?.isDarkMode == true) {
      _themeMode = themeDataDark;
      typeName = kStringDarkTheme;
    } else {
      _themeMode = themeData;
      typeName = kStringLightTheme;
    }
    notifyListeners();
  }

  ThemeData get themeMode => _themeMode;

  void setThemeDark() async {
    _themeMode = themeDataDark;
    typeName = kStringDarkTheme;
    await _prefHelper?.changeBrightnessToDark(true);
    notifyListeners();
  }

  void setThemeLight() async {
    _themeMode = themeData;
    typeName = kStringLightTheme;
    await _prefHelper?.changeBrightnessToDark(false);
    notifyListeners();
  }
}
