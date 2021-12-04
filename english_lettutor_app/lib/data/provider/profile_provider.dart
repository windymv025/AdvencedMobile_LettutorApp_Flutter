import 'dart:io';

import 'package:english_lettutor_app/models/profile/profile.dart';
import 'package:flutter/cupertino.dart';

class ProfileProvider extends ChangeNotifier {
  final Profile _profile = Profile();
  final Profile backupProfile = Profile();

  void copyProfile(Profile profile) {
    _profile.fromJson(profile.toJson());
    backupProfile.fromJson(profile.toJson());
  }

  void updateProfile() {
    _profile.fromJson(backupProfile.toJson());
    notifyListeners();
  }

  void clearChanges() {
    backupProfile.fromJson(_profile.toJson());
    notifyListeners();
  }

  int get id => _profile.id;
  set id(int value) {
    backupProfile.id = value;
    notifyListeners();
  }

  String get fullName => _profile.fullName;
  set fullName(String value) {
    backupProfile.fullName = value;
    notifyListeners();
  }

  String? get image => _profile.image;
  set image(String? value) {
    backupProfile.image = value;
    notifyListeners();
  }

  String get email => _profile.email;

  String? get country => _profile.country;
  set country(String? value) {
    backupProfile.country = value;
    notifyListeners();
  }

  String? get phone => _profile.phone;
  set phone(String? value) {
    backupProfile.phone = value;
    notifyListeners();
  }

  DateTime? get birthday => _profile.birthday;
  set birthday(DateTime? value) {
    backupProfile.birthday = value;
    notifyListeners();
  }

  String? get level => _profile.level;
  set level(String? value) {
    backupProfile.level = value;
    notifyListeners();
  }

  List<String> get wantToLearn => _profile.wantToLearn;
  set wantToLearn(List<String> value) {
    backupProfile.wantToLearn = value;
    notifyListeners();
  }

  File? get imageFile => _profile.imageFile;
  set imageFile(File? value) {
    backupProfile.imageFile = value;
    notifyListeners();
  }
}
