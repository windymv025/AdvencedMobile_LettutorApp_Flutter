import 'dart:io';

import 'package:english_lettutor_app/constants/constants.dart';
import 'package:english_lettutor_app/data/network/apis/authentication/auth-api.dart';
import 'package:english_lettutor_app/data/network/apis/user/user-api.dart';
import 'package:english_lettutor_app/data/sharedpref/shared_preference_helper.dart';
import 'package:english_lettutor_app/models/profile/profile.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class ProfileProvider extends ChangeNotifier {
  Profile profile = Profile();
  Profile backupProfile = Profile();
  final AuthApi _authApi = AuthApi();
  final UserApi _userApi = UserApi();
  String? emailSave, passwordSave;

  File? _imageFile;

  void updateProfile() {
    if (_imageFile != null) {
      _userApi.updateAvatar(_imageFile!).then((value) {
        _userApi.updateUserInformation(backupProfile).then((value) {
          if (value["user"] != null) {
            profile = Profile.fromMap(value["user"]);
            backupProfile = Profile.fromMap(value["user"]);
            analyticsUpdate("update_profile", true);
          } else {
            analyticsUpdate("update_profile", false);
          }
          notifyListeners();
        });
        if (value) {
          _imageFile = null;
          analyticsUpdate("update_avatar", true);
        } else {
          analyticsUpdate("update_avatar", false);
        }
      });
    } else {
      _userApi.updateUserInformation(backupProfile).then((value) {
        if (value["user"] != null) {
          profile = Profile.fromMap(value["user"]);
          backupProfile = Profile.fromMap(value["user"]);
          analyticsUpdate("update_profile", true);
        } else {
          analyticsUpdate("update_profile", false);
        }
        notifyListeners();
      });
    }
  }

  String get id => profile.id!;
  set id(String value) {
    backupProfile.id = value;
    notifyListeners();
  }

  String get fullName => profile.name!;
  set fullName(String value) {
    backupProfile.name = value;
    notifyListeners();
  }

  String? get image => profile.avatar;
  set image(String? value) {
    backupProfile.avatar = value;
    notifyListeners();
  }

  String get email => profile.email!;

  String? get country => kMapCountry[profile.country] ?? "";
  set country(String? value) {
    backupProfile.country = value;
    notifyListeners();
  }

  String? get phone => profile.phone;
  set phone(String? value) {
    backupProfile.phone = value;
    notifyListeners();
  }

  DateTime? get birthday => profile.birthday;
  set birthday(DateTime? value) {
    backupProfile.birthday = value;
    notifyListeners();
  }

  String? get level => profile.level;
  set level(String? value) {
    backupProfile.level =
        kMapLevels.entries.firstWhere((element) => element.value == value).key;
    notifyListeners();
  }

  List<String> get wantToLearn =>
      profile.learnTopics!.map((e) => e.name).toList();
  set wantToLearn(List<String> value) {
    backupProfile.learnTopics!.clear();
    backupProfile.learnTopics!
        .addAll(kTestPractices.where((e) => value.contains(e.name)).toList());
    notifyListeners();
  }

  List<String> get testPreparations =>
      profile.testPreparations!.map((e) => e.name).toList();
  set testPreparations(List<String> value) {
    backupProfile.testPreparations!.clear();
    backupProfile.testPreparations!
        .addAll(kLearnTopics.where((e) => value.contains(e.name)).toList());
    notifyListeners();
  }

  File? get imageFile => _imageFile;
  set imageFile(File? value) {
    _imageFile = value;
    notifyListeners();
  }

  // API:--------------------------------------------------------
  Future<bool> signIn(String email, String password) async {
    final result = await _authApi.login(email, password);
    if (result['user'] != null) {
      profile = Profile.fromMap(result["user"]);
      backupProfile = Profile.fromMap(result["user"]);
      saveTokens(result['tokens']!);
      saveAccount(email, password);
      analyticsLogin("Login with Email success: $email");

      return true;
    }
    analyticsLogin("Login with Email failed: $email");
    return false;
  }

  Future<bool> signUp(String email, String password) async {
    final result = await _authApi.register(email, password);
    if (result['user'] != null) {
      emailSave = email;
      passwordSave = password;
      notifyListeners();
      analyticsLogin("Sign up with Email success: ${profile.name}");
      return true;
    }
    analyticsLogin("Sign up with Email failed: $email");
    return false;
  }

  void saveTokens(Map<String, dynamic> tokens) {
    final prefs = SharedPreferenceHelper.instance;
    String accessToken = tokens['access']!['token']!;
    String refreshToken = tokens['refresh']!['token']!;
    prefs.saveAuthToken(accessToken);
    prefs.saveRefreshToken(refreshToken);
  }

  saveAccount(String email, String password) async {
    final prefs = SharedPreferenceHelper.instance;
    await prefs.saveUsername(email);
    await prefs.savePassword(password);
    notifyListeners();
  }

  Future<bool> signInWithGoogle() async {
    GoogleSignIn googleSignIn = GoogleSignIn();
    final googleUser = await googleSignIn.signIn();
    if (googleUser == null) return false;

    var googleAuth = await googleUser.authentication;
    String token = googleAuth.accessToken ?? "";
    final result = await _authApi.loginByGoogle(token);
    if (result['user'] != null) {
      profile = Profile.fromMap(result["user"]);
      backupProfile = Profile.fromMap(result["user"]);
      saveTokens(result['tokens']!);
      analyticsLogin("Login with Google success: ${profile.name}");
      return true;
    }
    analyticsLogin("Login with Google failed");
    return false;
  }

  Future<bool> signInWithFacebook() async {
    var fbAuth = await FacebookAuth.instance.login();
    if (fbAuth.status != LoginStatus.success) return false;

    var accessToken = fbAuth.accessToken;
    String token = accessToken?.token ?? "";
    final result = await _authApi.loginByFacebook(token);
    if (result['user'] != null) {
      profile = Profile.fromMap(result["user"]);
      backupProfile = Profile.fromMap(result["user"]);
      saveTokens(result['tokens']!);
      analyticsLogin("Login with Facebook success: ${profile.name}");
      return true;
    }
    analyticsLogin("Login with Facebook failed");
    return false;
  }

  Future<bool> fogotPassword(String email) async {
    final result = await _authApi.fogotPassword(email);
    if (result['statusCode'] != null) {
      return false;
    }
    return true;
  }

  Future analyticsLogin(String nameMethod) async {
    await FirebaseAnalytics.instance.logLogin(
      loginMethod: nameMethod,
    );
  }

  Future analyticsUpdate(String nameMethod, bool status) async {
    await FirebaseAnalytics.instance.logEvent(name: nameMethod, parameters: {
      "user_id": profile.id,
      "user_name": profile.name,
      "user_email": profile.email,
      "user_avatar": profile.avatar,
      "status": status ? "success" : "failed"
    });
  }
}
