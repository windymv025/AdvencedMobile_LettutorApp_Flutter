import 'package:english_lettutor_app/constants/assets.dart';
import 'package:flutter/cupertino.dart';

class Profile extends ChangeNotifier {
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

  Profile();

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
