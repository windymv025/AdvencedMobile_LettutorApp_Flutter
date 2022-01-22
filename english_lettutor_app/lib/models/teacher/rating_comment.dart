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

  factory RatingComment.fromMap(Map<String, dynamic> json) => RatingComment(
        rating: json["rating"].toDouble(),
        comment: json["content"],
        time: DateTime.parse(json["updatedAt"]),
        student: Profile.fromMapSimple(json["firstInfo"]),
      );
}
