import 'package:english_lettutor_app/constants/constants.dart';
import 'package:english_lettutor_app/constants/design/theme.dart';
import 'package:english_lettutor_app/data/sharedpref/shared_preference_helper.dart';
import 'package:flutter/material.dart';

class ThemeModel extends ChangeNotifier {
  SharedPreferenceHelper? _prefHelper;

  ThemeData _themeMode = themeData;
  ThemeMode _themeModeType = ThemeMode.system;

  ThemeMode get themeModeType => _themeModeType;

  String _typeName = kStringLightTheme;
  String get typeName => _typeName;
  ThemeModel() {
    _loadTheme();
  }

  void _loadTheme() {
    _prefHelper = SharedPreferenceHelper.instance;
    bool? isDark = _prefHelper?.isDarkMode;
    if (isDark == true) {
      _themeMode = themeDataDark;
      _typeName = kStringDarkTheme;
      _themeModeType = ThemeMode.dark;
    } else if (isDark == false) {
      _themeMode = themeData;
      _typeName = kStringLightTheme;
      _themeModeType = ThemeMode.dark;
    } else {
      _themeMode = themeData;
      _typeName = kStringLightTheme;
      _themeModeType = ThemeMode.system;
    }
    notifyListeners();
  }

  ThemeData get themeMode => _themeMode;

  void setThemeDark() async {
    _themeMode = themeDataDark;
    _typeName = kStringDarkTheme;
    _themeModeType = ThemeMode.dark;
    await _prefHelper?.changeBrightnessToDark(true);
    notifyListeners();
  }

  void setThemeLight() async {
    _themeMode = themeData;
    _typeName = kStringLightTheme;
    _themeModeType = ThemeMode.light;
    await _prefHelper?.changeBrightnessToDark(false);
    notifyListeners();
  }

  void setThemeSystem() {
    _typeName = kStringSystemTheme;
    _themeModeType = ThemeMode.system;
    _prefHelper?.setThemeModeBySystem();
    notifyListeners();
  }
}
