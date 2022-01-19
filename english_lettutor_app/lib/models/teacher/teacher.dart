import 'package:english_lettutor_app/data/network/apis/tutor/tutor-api.dart';
import 'package:english_lettutor_app/models/profile/profile.dart';

import 'rating_comment.dart';

class Teacher {
  String id = "";
  String? uriVideo;
  String? uriImage;
  String? name;
  String? description;
  List<String>? languages;
  String? education;
  String? experience;
  String? interests;
  String? profession;
  List<String>? specialties;
  double? ratings;
  List<RatingComment>? ratingComments;
  List<DateTime>? freeDate;
  bool? isOnline;
  bool isFavorite = false;
  String country = '';
  DateTime? birthday;

  String? level;

  Teacher(
      {required this.id,
      required this.name,
      required this.specialties,
      required this.country,
      this.uriImage,
      required this.description,
      required this.uriVideo,
      this.education,
      this.experience,
      this.interests,
      this.languages,
      this.profession,
      this.freeDate,
      this.ratings = 0,
      this.isOnline,
      this.isFavorite = false,
      this.ratingComments,
      this.level,
      this.birthday});

  Teacher.toProfile(Profile profile) {
    id = profile.id!;
    name = profile.name;
    country = profile.country ?? '';
    birthday = profile.birthday;
    languages = [];
    specialties = [];
  }

  factory Teacher.fromMap(Map<String, dynamic> json) => Teacher(
        id: json["userId"].toString(),
        uriVideo: json["video"],
        description: json["bio"],
        education: json["education"],
        experience: json["experience"],
        profession: json["profession"],
        interests: json["interests"],
        languages: json["languages"].toString().split(',').toList(),
        specialties: json["specialties"].toString().split(',').toList(),
        uriImage: json["User"]["avatar"],
        country: json["User"]["country"],
        isFavorite: json["isFavorite"],
        ratings: json["avgRating"].toDouble(),
        name: json["User"]["name"],
        level: json["level"],
        ratingComments: (json["User"]["feedbacks"] as List)
            .map((e) => RatingComment.fromMap(e))
            .toList(),
      );

  static Future<Teacher?> loadTeacherDetail(String id) async {
    var res = await TutorApi().getTutorInformationById(id);
    if (res["statusCode"] != null) return null;

    return Teacher.fromMap(res);
  }
}
