import 'package:english_lettutor_app/utilities/constants/assets.dart';
import 'package:english_lettutor_app/utilities/constants/constants.dart';

class Course {
  String? image;
  String? name;
  String? subtitle;
  String? level;
  int lessons = 0;

  Course(
      {required this.image,
      required this.name,
      required this.subtitle,
      required this.level,
      this.lessons = 0});
  Course.getDefault() {
    image = Assets.assetsImagesCloudData;
    name = "Basic Conversation";
    subtitle = "Gain confidence speaking about familiar topics";
    level = kLevels[0];
    lessons = 5;
  }
}
