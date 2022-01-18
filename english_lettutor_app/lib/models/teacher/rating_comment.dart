import 'package:english_lettutor_app/models/profile/profile.dart';

class RatingComment {
  double? rating;
  String? comment;
  DateTime? time;
  Profile? student;

  RatingComment(
      {required this.rating,
      required this.comment,
      required this.time,
      required this.student});

  RatingComment.getDefault() {
    rating = 4;
    comment = "He is best teacher";
    time = DateTime.now();
    // student = Profile.getDefault();
  }
}
