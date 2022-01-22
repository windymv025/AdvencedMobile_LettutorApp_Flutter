import 'package:english_lettutor_app/models/course/course-models.dart';

class Course {
  String? id;
  String? image;
  String? name;
  String? subtitle;
  String? level;
  int lessons = 0;
  String? whyTakeCourse;
  String? whatBeAbleToDo;
  List<Topic>? topics;

  Course(
      {this.id,
      required this.image,
      required this.name,
      required this.subtitle,
      required this.level,
      this.lessons = 0,
      this.topics,
      this.whatBeAbleToDo,
      this.whyTakeCourse});
}
