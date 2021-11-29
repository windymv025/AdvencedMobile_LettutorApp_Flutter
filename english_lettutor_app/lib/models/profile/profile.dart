import 'package:english_lettutor_app/constants/assets.dart';

class Profile {
  String? fullName;
  String? image;
  String? email;
  String? country;
  String? phone;
  DateTime? birthDay;
  String? level;
  List<String>? wantToLearn;

  Profile(
      {this.fullName,
      this.image,
      this.email,
      this.country,
      this.phone,
      this.birthDay,
      this.level,
      this.wantToLearn});

  Profile.getDefault() {
    fullName = "Pham Minh Vuong";
    image = Assets.assetsImagesNoDataFound;
    email = "windymv025@gmail.com";
    country = "Viet Nam";
    phone = "08868805301";
    birthDay = DateTime.utc(2000, 10, 25);
    level = "Beginner";
    wantToLearn = ["English for beginer", "TOIEC"];
  }
}
