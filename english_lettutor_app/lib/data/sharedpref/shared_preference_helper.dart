import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

import 'constants/preferences.dart';

class SharedPreferenceHelper {
  // shared pref instance
  static SharedPreferenceHelper? _instance;

  static SharedPreferenceHelper get instance {
    _instance ??= SharedPreferenceHelper._();
    return _instance!;
  }

  // constructor
  // SharedPreferenceHelper(this._sharedPreference?);
  SharedPreferenceHelper._();

  // General Methods: ----------------------------------------------------------
  Future<String?> get authToken async {
    SharedPreferences _sharedPreference = await SharedPreferences.getInstance();
    return _sharedPreference.getString(Preferences.authToken);
  }

  Future<bool> saveAuthToken(String authToken) async {
    SharedPreferences _sharedPreference = await SharedPreferences.getInstance();
    return _sharedPreference.setString(Preferences.authToken, authToken);
  }

  // Refresh Token: -------------------------------------------------------------
  Future<bool> removeAuthToken() async {
    SharedPreferences _sharedPreference = await SharedPreferences.getInstance();
    return _sharedPreference.remove(Preferences.refreshToken);
  }

  Future<String?> get refreshToken async {
    SharedPreferences _sharedPreference = await SharedPreferences.getInstance();
    return _sharedPreference.getString(Preferences.refreshToken);
  }

  Future<bool> saveRefreshToken(String refreshToken) async {
    SharedPreferences _sharedPreference = await SharedPreferences.getInstance();
    return _sharedPreference.setString(Preferences.refreshToken, refreshToken);
  }

  Future<bool> removeRefreshToken() async {
    SharedPreferences _sharedPreference = await SharedPreferences.getInstance();

    return _sharedPreference.remove(Preferences.refreshToken);
  }

  // Login:---------------------------------------------------------------------
  Future<bool> get isLoggedIn async {
    SharedPreferences _sharedPreference = await SharedPreferences.getInstance();

    return _sharedPreference.getBool(Preferences.isLoggedIn) ?? false;
  }

  Future<bool> saveIsLoggedIn(bool value) async {
    SharedPreferences _sharedPreference = await SharedPreferences.getInstance();

    return _sharedPreference.setBool(Preferences.isLoggedIn, value);
  }

  //profile:--------------------------------------------------------------------

  //Password:-------------------------------------------------------------------
  Future<bool> savePassword(String password) async {
    SharedPreferences _sharedPreference = await SharedPreferences.getInstance();
    return _sharedPreference.setString(Preferences.password, password);
  }

  Future<String?> get password async {
    SharedPreferences _sharedPreference = await SharedPreferences.getInstance();

    return _sharedPreference.getString(Preferences.password);
  }

  Future<bool> removePassword() async {
    SharedPreferences _sharedPreference = await SharedPreferences.getInstance();

    return _sharedPreference.remove(Preferences.password);
  }

  // Theme:------------------------------------------------------
  Future<bool?> get isDarkMode async {
    SharedPreferences _sharedPreference = await SharedPreferences.getInstance();

    return _sharedPreference.getBool(Preferences.isDarkMode);
  }

  Future<bool> changeBrightnessToDark(bool value) async {
    SharedPreferences _sharedPreference = await SharedPreferences.getInstance();
    return _sharedPreference.setBool(Preferences.isDarkMode, value);
  }

  Future<bool> setThemeModeBySystem() async {
    SharedPreferences _sharedPreference = await SharedPreferences.getInstance();
    return _sharedPreference.remove(Preferences.isDarkMode);
  }

  // Language:---------------------------------------------------
  Future<String?> get currentLanguage async {
    SharedPreferences _sharedPreference = await SharedPreferences.getInstance();
    return _sharedPreference.getString(Preferences.currentLanguage);
  }

  Future<bool> changeLanguage(String language) async {
    SharedPreferences _sharedPreference = await SharedPreferences.getInstance();
    return _sharedPreference.setString(Preferences.currentLanguage, language);
  }

  //Password:-------------------------------------------------------------------
  Future<bool> saveUsername(String username) async {
    SharedPreferences _sharedPreference = await SharedPreferences.getInstance();
    return _sharedPreference.setString(Preferences.username, username);
  }

  Future<String?> get username async {
    SharedPreferences _sharedPreference = await SharedPreferences.getInstance();

    return _sharedPreference.getString(Preferences.username);
  }

  Future<bool> removeUsername() async {
    SharedPreferences _sharedPreference = await SharedPreferences.getInstance();

    return _sharedPreference.remove(Preferences.username);
  }
}
