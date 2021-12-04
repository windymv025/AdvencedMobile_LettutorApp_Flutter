import 'dart:io';

import 'package:english_lettutor_app/constants/assets.dart';
import 'package:flutter/cupertino.dart';

class Profile extends ChangeNotifier {
  int id = 0;
  late String _fullName;

  String get fullName => _fullName;
  set fullName(String value) {
    _fullName = value;
    notifyListeners();
  }

  late String? _image;
  String? get image => _image;
  set image(String? value) {
    _image = value;
    notifyListeners();
  }

  late String email;
  // String get email => _email;
  // set email(String value) {
  //   _email = value;
  //   notifyListeners();
  // }

  late String? country;
  late String? phone;
  late DateTime? birthday;
  String? _level;
  String? get level => _level;
  set level(String? value) {
    _level = value;
    notifyListeners();
  }

  late List<String>? wantToLearn;

  File? _imageFile;
  File? get imageFile => _imageFile;
  set imageFile(File? value) {
    _imageFile = value;
    notifyListeners();
  }

  Profile() {
    _fullName = "";
    _image = null;
    email = "";
    country = "";
    phone = "";
    birthday = null;
    _level = null;
    wantToLearn = null;
  }

  Profile.getDefault() {
    fullName = "Pham Minh Vuong";
    image = Assets.assetsImagesNoDataFound;
    email = "windymv025@gmail.com";
    country = "Viet Nam";
    phone = "08868805301";
    birthday = DateTime.utc(2000, 10, 25);
    level = "Beginner";
    wantToLearn = ["English for beginer", "TOIEC"];
  }
}
