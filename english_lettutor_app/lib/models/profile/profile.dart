import 'dart:io';

import 'package:english_lettutor_app/constants/assets.dart';

class Profile {
  int id = 0;
  late String fullName;

  String? image;

  late String email;
  // String get email => email;
  // set email(String value) {
  //   email = value;
  //   notifyListeners();
  // }

  String? country;
  String? phone;
  DateTime? birthday;
  String? level;

  List<String> wantToLearn = [];

  File? imageFile;

  void fromJson(Map<String, dynamic> json) {
    id = json['id'] as int;
    fullName = json['fullName'];
    image = json['image'];
    email = json['email'];
    country = json['country'];
    phone = json['phone'];
    birthday = json['birthday'] != null
        ? DateTime.parse(json['birthday'] as String)
        : null;
    level = json['level'];
    wantToLearn = json['wantToLearn'] as List<String>;
    imageFile =
        json['imageFile'] != null ? File(json['imageFile'] as String) : null;
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'fullName': fullName,
      'image': image,
      'email': email,
      'country': country,
      'phone': phone,
      'birthday': birthday != null ? birthday!.toIso8601String() : null,
      'level': level,
      'wantToLearn': wantToLearn,
      'imageFile': imageFile != null ? imageFile!.path : null,
    };
  }

  Profile() {
    fullName = "";
    image = null;
    email = "";
    country = "";
    phone = "";
    birthday = null;
    level = null;
    wantToLearn = [];
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

  Profile.getDefault2() {
    fullName = "Pham Minh Vuong";
    image = Assets.assetsImagesNoDataFound;
    email = "windymv025@gmail.com";
  }
}
