import 'package:english_lettutor_app/constants/constants.dart';
import 'package:english_lettutor_app/models/teacher/teacher.dart';

class TutorInPage {
  TutorInPage({
    required this.tutors,
    required this.favoriteTutor,
  });

  Tutors tutors;
  List<FavoriteTutor> favoriteTutor;

  factory TutorInPage.fromMap(Map<String, dynamic> json) => TutorInPage(
        tutors: Tutors.fromMap(json["tutors"]),
        favoriteTutor: List<FavoriteTutor>.from(
            json["favoriteTutor"].map((x) => FavoriteTutor.fromMap(x))),
      );

  int get totalPage {
    return (tutors.count / 12).ceil();
  }

  List<ItemTutor> get recommendedTutor {
    tutors.setFavoritesItem(favoriteTutor.map((e) => e.secondId).toList());
    return tutors.rows;
  }

  Map<String, dynamic> toMap() => {
        "tutors": tutors.toMap(),
        "favoriteTutor":
            List<dynamic>.from(favoriteTutor.map((x) => x.toMap())),
      };

  void sortTeacher() {
    tutors.sortTeacher(favoriteTutor.map((e) => e.secondId).toList());
  }

  void addFavourite(String userId) {
    favoriteTutor.add(FavoriteTutor(secondId: userId));
  }

  List<Teacher> getFavorite() {
    List<Teacher> teachers = [];
    for (var f in favoriteTutor) {
      teachers.add(Teacher(
        id: f.secondId!,
        name: f.secondInfo?.name,
        uriImage: f.secondInfo?.avatar,
        isFavorite: true,
        country: f.secondInfo!.country!,
        languages: null,
        uriVideo: f.secondInfo?.tutorInfo?.video,
        description: f.secondInfo?.tutorInfo?.bio,
        specialties: f.secondInfo?.tutorInfo?.specialties?.split(","),
        education: f.secondInfo?.tutorInfo?.education,
        experience: f.secondInfo?.tutorInfo?.experience,
        interests: f.secondInfo?.tutorInfo?.interests,
        profession: f.secondInfo?.tutorInfo?.profession,
      ));
    }
    return teachers;
  }
}

class FavoriteTutor {
  FavoriteTutor({
    this.id,
    this.firstId,
    this.secondId,
    this.createdAt,
    this.updatedAt,
    this.secondInfo,
  });

  String? id;
  String? firstId;
  String? secondId;
  DateTime? createdAt;
  DateTime? updatedAt;
  Info? secondInfo;

  factory FavoriteTutor.fromMap(Map<String, dynamic> json) => FavoriteTutor(
        id: json["id"],
        firstId: json["firstId"],
        secondId: json["secondId"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        secondInfo: json["secondInfo"] == null
            ? null
            : Info.fromMap(json["secondInfo"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "firstId": firstId,
        "secondId": secondId,
        "createdAt": createdAt == null ? null : createdAt!.toIso8601String(),
        "updatedAt": updatedAt == null ? null : updatedAt!.toIso8601String(),
        "secondInfo": secondInfo == null ? null : secondInfo!.toMap(),
      };
}

class Info {
  Info({
    this.id,
    this.level,
    this.email,
    this.google,
    this.facebook,
    this.apple,
    this.avatar,
    this.name,
    this.country,
    this.phone,
    this.language,
    this.birthday,
    this.requestPassword,
    this.isActivated,
    this.isPhoneActivated,
    this.requireNote,
    this.timezone,
    this.phoneAuth,
    this.isPhoneAuthActivated,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.tutorInfo,
  });

  String? id;
  String? level;
  String? email;
  String? google;
  dynamic facebook;
  dynamic apple;
  String? avatar;
  String? name;
  String? country;
  String? phone;
  String? language;
  DateTime? birthday;
  bool? requestPassword;
  bool? isActivated;
  bool? isPhoneActivated;
  dynamic requireNote;
  int? timezone;
  dynamic phoneAuth;
  bool? isPhoneAuthActivated;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic deletedAt;
  TutorInfo? tutorInfo;

  factory Info.fromMap(Map<String, dynamic> json) => Info(
        id: json["id"],
        level: json["level"],
        email: json["email"],
        google: json["google"],
        facebook: json["facebook"],
        apple: json["apple"],
        avatar: json["avatar"],
        name: json["name"],
        country: json["country"],
        phone: json["phone"],
        language: json["language"],
        birthday: json["birthday"] == null
            ? null
            : DateTime.tryParse(json["birthday"]),
        requestPassword: json["requestPassword"],
        isActivated: json["isActivated"],
        isPhoneActivated: json["isPhoneActivated"],
        requireNote: json["requireNote"],
        timezone: json["timezone"],
        phoneAuth: json["phoneAuth"],
        isPhoneAuthActivated: json["isPhoneAuthActivated"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.tryParse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.tryParse(json["updatedAt"]),
        deletedAt: json["deletedAt"],
        tutorInfo: json["tutorInfo"] == null
            ? null
            : TutorInfo.fromMap(json["tutorInfo"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "level": level,
        "email": email,
        "google": google,
        "facebook": facebook,
        "apple": apple,
        "avatar": avatar,
        "name": name,
        "country": country,
        "phone": phone,
        "language": language,
        "birthday": birthday == null
            ? null
            : "${birthday?.year.toString().padLeft(4, '0')}-${birthday?.month.toString().padLeft(2, '0')}-${birthday?.day.toString().padLeft(2, '0')}",
        "requestPassword": requestPassword,
        "isActivated": isActivated,
        "isPhoneActivated": isPhoneActivated,
        "requireNote": requireNote,
        "timezone": timezone,
        "phoneAuth": phoneAuth,
        "isPhoneAuthActivated": isPhoneAuthActivated,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "deletedAt": deletedAt,
        "tutorInfo": tutorInfo?.toMap(),
      };
}

class TutorInfo {
  TutorInfo({
    this.id,
    this.userId,
    this.video,
    this.bio,
    this.education,
    this.experience,
    this.profession,
    this.accent,
    this.targetStudent,
    this.interests,
    this.languages,
    this.specialties,
    this.resume,
    this.isActivated,
    this.isNative,
    this.createdAt,
    this.updatedAt,
  });

  String? id;
  String? userId;
  String? video;
  String? bio;
  String? education;
  String? experience;
  String? profession;
  dynamic accent;
  String? targetStudent;
  String? interests;
  String? languages;
  String? specialties;
  dynamic resume;
  bool? isActivated;
  dynamic isNative;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory TutorInfo.fromMap(Map<String, dynamic> json) => TutorInfo(
        id: json["id"],
        userId: json["userId"],
        video: json["video"],
        bio: json["bio"],
        education: json["education"],
        experience: json["experience"],
        profession: json["profession"],
        accent: json["accent"],
        targetStudent: json["targetStudent"],
        interests: json["interests"],
        languages: json["languages"],
        specialties: json["specialties"],
        resume: json["resume"],
        isActivated: json["isActivated"],
        isNative: json["isNative"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "userId": userId,
        "video": video,
        "bio": bio,
        "education": education,
        "experience": experience,
        "profession": profession,
        "accent": accent,
        "targetStudent": targetStudent,
        "interests": interests,
        "languages": languages,
        "specialties": specialties,
        "resume": resume,
        "isActivated": isActivated,
        "isNative": isNative,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
      };
}

class Tutors {
  Tutors({
    required this.count,
    required this.rows,
  });

  int count;
  List<ItemTutor> rows;

  factory Tutors.fromMap(Map<String, dynamic> json) => Tutors(
        count: json["count"],
        rows:
            List<ItemTutor>.from(json["rows"].map((x) => ItemTutor.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "count": count,
        "rows": List<dynamic>.from(rows.map((x) => x.toMap())),
      };

  void sortTeacher(List<String?> list) {
    rows.sort((b, a) {
      if (list.contains(a.userId) && !list.contains(b.userId)) {
        return 1;
      } else if (!list.contains(a.id) && list.contains(b.userId)) {
        return -1;
      } else {
        return a.getRating().compareTo(b.getRating());
      }
    });
  }

  void setFavoritesItem(List<String?> list) {
    for (var element in rows) {
      element.isFavorite = list.contains(element.userId);
    }
  }

  List<Teacher> getTutorList() {
    List<Teacher> list = [];
    for (var element in rows) {
      list.add(Teacher(
        id: element.userId!,
        name: element.name,
        uriImage: element.avatar,
        ratings: element.getRating(),
        isFavorite: false,
        country: kMapCountry[element.country] ?? "",
        languages: null,
        description: element.bio,
        specialties: element.specialties?.split(","),
        education: element.education,
        experience: element.experience,
        interests: element.interests,
        profession: element.profession,
        uriVideo: element.video,
      ));
    }
    return list;
  }
}

class ItemTutor {
  ItemTutor({
    this.level,
    this.email,
    this.google,
    this.facebook,
    this.apple,
    this.avatar,
    this.name,
    this.country,
    this.phone,
    this.language,
    this.birthday,
    this.requestPassword,
    this.isActivated,
    this.isPhoneActivated,
    this.requireNote,
    this.timezone,
    this.phoneAuth,
    this.isPhoneAuthActivated,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.feedbacks,
    this.id,
    this.userId,
    this.video,
    this.bio,
    this.education,
    this.experience,
    this.profession,
    this.accent,
    this.targetStudent,
    this.interests,
    this.languages,
    this.specialties,
    this.resume,
    this.isNative,
    this.price,
    this.isOnline,
  });

  late bool isFavorite;

  String? level;
  String? email;
  dynamic google;
  dynamic facebook;
  dynamic apple;
  String? avatar;
  String? name;
  String? country;
  String? phone;
  dynamic language;
  DateTime? birthday;
  bool? requestPassword;
  bool? isActivated;
  dynamic isPhoneActivated;
  dynamic requireNote;
  int? timezone;
  dynamic phoneAuth;
  bool? isPhoneAuthActivated;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic deletedAt;
  List<Feedback>? feedbacks;
  String? id;
  String? userId;
  String? video;
  String? bio;
  String? education;
  String? experience;
  String? profession;
  dynamic accent;
  String? targetStudent;
  String? interests;
  String? languages;
  String? specialties;
  dynamic resume;
  dynamic isNative;
  int? price;
  bool? isOnline;

  factory ItemTutor.fromMap(Map<String, dynamic> json) => ItemTutor(
        level: json["level"],
        email: json["email"],
        google: json["google"],
        facebook: json["facebook"],
        apple: json["apple"],
        avatar: json["avatar"],
        name: json["name"],
        country: json["country"],
        phone: json["phone"],
        language: json["language"],
        birthday:
            json["birthday"] == null ? null : DateTime.parse(json["birthday"]),
        requestPassword: json["requestPassword"],
        isActivated: json["isActivated"],
        isPhoneActivated: json["isPhoneActivated"],
        requireNote: json["requireNote"],
        timezone: json["timezone"],
        phoneAuth: json["phoneAuth"],
        isPhoneAuthActivated: json["isPhoneAuthActivated"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        deletedAt: json["deletedAt"],
        feedbacks: json["feedbacks"] == null
            ? null
            : List<Feedback>.from(
                json["feedbacks"].map((x) => Feedback.fromMap(x))),
        id: json["id"],
        userId: json["userId"],
        video: json["video"],
        bio: json["bio"],
        education: json["education"],
        experience: json["experience"],
        profession: json["profession"],
        accent: json["accent"],
        targetStudent: json["targetStudent"],
        interests: json["interests"],
        languages: json["languages"],
        specialties: json["specialties"],
        resume: json["resume"],
        isNative: json["isNative"],
        price: json["price"],
        isOnline: json["isOnline"],
      );

  Map<String, dynamic> toMap() => {
        "level": level,
        "email": email,
        "google": google,
        "facebook": facebook,
        "apple": apple,
        "avatar": avatar,
        "name": name,
        "country": country,
        "phone": phone,
        "language": language,
        "birthday": birthday == null
            ? null
            : "${birthday?.year.toString().padLeft(4, '0')}-${birthday?.month.toString().padLeft(2, '0')}-${birthday?.day.toString().padLeft(2, '0')}",
        "requestPassword": requestPassword,
        "isActivated": isActivated,
        "isPhoneActivated": isPhoneActivated,
        "requireNote": requireNote,
        "timezone": timezone,
        "phoneAuth": phoneAuth,
        "isPhoneAuthActivated": isPhoneAuthActivated,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "deletedAt": deletedAt,
        "feedbacks": feedbacks == null
            ? null
            : List<dynamic>.from(feedbacks!.map((x) => x.toMap())),
        "id": id,
        "userId": userId,
        "video": video,
        "bio": bio,
        "education": education,
        "experience": experience,
        "profession": profession,
        "accent": accent,
        "targetStudent": targetStudent,
        "interests": interests,
        "languages": languages,
        "specialties": specialties,
        "resume": resume,
        "isNative": isNative,
        "price": price,
        "isOnline": isOnline,
      };

  double getRating() {
    if (feedbacks == null) {
      return 0;
    }
    double rating = 0;
    for (var feedback in feedbacks!) {
      rating += feedback.rating! * 1.0;
    }
    return rating / feedbacks!.length;
  }
}

class Feedback {
  Feedback({
    this.id,
    this.bookingId,
    this.firstId,
    this.secondId,
    this.rating,
    this.content,
    this.createdAt,
    this.updatedAt,
    this.firstInfo,
  });

  String? id;
  String? bookingId;
  String? firstId;
  String? secondId;
  int? rating;
  String? content;
  DateTime? createdAt;
  DateTime? updatedAt;
  Info? firstInfo;

  factory Feedback.fromMap(Map<String, dynamic> json) => Feedback(
        id: json["id"],
        bookingId: json["bookingId"],
        firstId: json["firstId"],
        secondId: json["secondId"],
        rating: json["rating"],
        content: json["content"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        firstInfo:
            json["firstInfo"] == null ? null : Info.fromMap(json["firstInfo"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "bookingId": bookingId,
        "firstId": firstId,
        "secondId": secondId,
        "rating": rating,
        "content": content,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "firstInfo": firstInfo?.toMap(),
      };
}
