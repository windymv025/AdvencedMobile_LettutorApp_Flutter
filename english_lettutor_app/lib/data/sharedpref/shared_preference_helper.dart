import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

import 'constants/preferences.dart';

class SharedPreferenceHelper {
  // shared pref instance
  SharedPreferences? _sharedPreference;
  static SharedPreferenceHelper? _instance;

  static SharedPreferenceHelper get instance {
    _instance ??= SharedPreferenceHelper._();
    return _instance!;
  }

  // constructor
  // SharedPreferenceHelper(this._sharedPreference?);
  SharedPreferenceHelper._() {
    _init();
  }

  _init() {
    SharedPreferences.getInstance().then((prefs) {
      _sharedPreference = prefs;
    });
  }

  // General Methods: ----------------------------------------------------------
  Future<String?> get authToken async {
    return _sharedPreference?.getString(Preferences.authToken);
  }

  Future<bool> saveAuthToken(String authToken) async {
    return _sharedPreference!.setString(Preferences.authToken, authToken);
  }

  // Refresh Token: -------------------------------------------------------------
  Future<bool> removeAuthToken() async {
    return _sharedPreference!.remove(Preferences.refreshToken);
  }

  Future<String?> get refreshToken async {
    return _sharedPreference?.getString(Preferences.refreshToken);
  }

  Future<bool> saveRefreshToken(String refreshToken) async {
    return _sharedPreference!.setString(Preferences.refreshToken, refreshToken);
  }

  Future<bool> removeRefreshToken() async {
    return _sharedPreference!.remove(Preferences.refreshToken);
  }

  // Login:---------------------------------------------------------------------
  Future<bool> get isLoggedIn async {
    return _sharedPreference?.getBool(Preferences.isLoggedIn) ?? false;
  }

  Future<bool> saveIsLoggedIn(bool value) async {
    return _sharedPreference!.setBool(Preferences.isLoggedIn, value);
  }

  //profile:--------------------------------------------------------------------

  //Password:-------------------------------------------------------------------
  Future<bool> savePassword(String password) async {
    return _sharedPreference!.setString(Preferences.password, password);
  }

  Future<String?> get password async {
    return _sharedPreference?.getString(Preferences.password);
  }

  Future<bool> removePassword() async {
    return _sharedPreference!.remove(Preferences.password);
  }

  // Theme:------------------------------------------------------
  bool? get isDarkMode {
    return _sharedPreference?.getBool(Preferences.isDarkMode);
  }

  Future<void> changeBrightnessToDark(bool value) {
    return _sharedPreference!.setBool(Preferences.isDarkMode, value);
  }

  Future<void> setThemeModeBySystem() {
    return _sharedPreference!.remove(Preferences.isDarkMode);
  }

  // Language:---------------------------------------------------
  String? get currentLanguage {
    return _sharedPreference?.getString(Preferences.currentLanguage);
  }

  Future<void> changeLanguage(String language) {
    return _sharedPreference!.setString(Preferences.currentLanguage, language);
  }
}
