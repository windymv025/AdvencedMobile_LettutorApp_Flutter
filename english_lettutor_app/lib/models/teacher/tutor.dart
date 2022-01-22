class Tutor {
  Tutor({
    required this.id,
    required this.userId,
    required this.video,
    required this.bio,
    required this.education,
    required this.experience,
    required this.profession,
    required this.accent,
    required this.targetStudent,
    required this.interests,
    required this.languages,
    required this.specialties,
    required this.resume,
    required this.isActivated,
    required this.isNative,
    required this.createdAt,
    required this.updatedAt,
    required this.user,
    required this.isFavorite,
    required this.avgRating,
    required this.price,
  });

  String id;
  String userId;
  String video;
  String bio;
  String education;
  String experience;
  String profession;
  dynamic accent;
  String targetStudent;
  String interests;
  String languages;
  String specialties;
  dynamic resume;
  bool isActivated;
  dynamic isNative;
  DateTime createdAt;
  DateTime updatedAt;
  User user;
  bool isFavorite;
  double avgRating;
  int price;

  factory Tutor.fromMap(Map<String, dynamic> json) => Tutor(
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
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        user: User.fromMap(json["User"]),
        isFavorite: json["isFavorite"],
        avgRating: json["avgRating"].toDouble(),
        price: json["price"],
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
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "User": user.toMap(),
        "isFavorite": isFavorite,
        "avgRating": avgRating,
        "price": price,
      };
}

class Feedback {
  Feedback({
    required this.id,
    this.bookingId,
    required this.firstId,
    required this.secondId,
    required this.rating,
    required this.content,
    required this.createdAt,
    required this.updatedAt,
    required this.firstInfo,
  });

  String id;
  String? bookingId;
  String firstId;
  String secondId;
  int rating;
  String content;
  DateTime createdAt;
  DateTime updatedAt;
  User firstInfo;

  factory Feedback.fromMap(Map<String, dynamic> json) => Feedback(
        id: json["id"],
        bookingId: json["bookingId"],
        firstId: json["firstId"],
        secondId: json["secondId"],
        rating: json["rating"],
        content: json["content"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        firstInfo: User.fromMap(json["firstInfo"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "bookingId": bookingId,
        "firstId": firstId,
        "secondId": secondId,
        "rating": rating,
        "content": content,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "firstInfo": firstInfo.toMap(),
      };
}

class User {
  User({
    required this.id,
    required this.level,
    required this.email,
    required this.google,
    required this.facebook,
    required this.apple,
    required this.avatar,
    required this.name,
    required this.country,
    required this.phone,
    required this.language,
    required this.birthday,
    required this.requestPassword,
    required this.isActivated,
    required this.isPhoneActivated,
    required this.requireNote,
    required this.timezone,
    required this.phoneAuth,
    required this.isPhoneAuthActivated,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
    required this.feedbacks,
    required this.courses,
  });

  String id;
  String? level;
  String email;
  String? google;
  dynamic facebook;
  dynamic apple;
  String avatar;
  String name;
  String? country;
  String phone;
  String? language;
  DateTime? birthday;
  bool requestPassword;
  bool isActivated;
  bool? isPhoneActivated;
  dynamic requireNote;
  int timezone;
  dynamic phoneAuth;
  bool isPhoneAuthActivated;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;
  List<Feedback>? feedbacks;
  List<Course>? courses;

  factory User.fromMap(Map<String, dynamic> json) => User(
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
        birthday:
            json["birthday"] == null ? null : DateTime.parse(json["birthday"]),
        requestPassword: json["requestPassword"],
        isActivated: json["isActivated"],
        isPhoneActivated: json["isPhoneActivated"],
        requireNote: json["requireNote"],
        timezone: json["timezone"],
        phoneAuth: json["phoneAuth"],
        isPhoneAuthActivated: json["isPhoneAuthActivated"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        deletedAt: json["deletedAt"],
        feedbacks: json["feedbacks"] == null
            ? null
            : List<Feedback>.from(
                json["feedbacks"].map((x) => Feedback.fromMap(x))),
        courses: json["courses"] == null
            ? null
            : List<Course>.from(json["courses"].map((x) => Course.fromMap(x))),
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
        "country": country == null ? null : country!,
        "phone": phone,
        "language": language,
        "birthday": birthday == null
            ? null
            : "${birthday!.year.toString().padLeft(4, '0')}-${birthday!.month.toString().padLeft(2, '0')}-${birthday!.day.toString().padLeft(2, '0')}",
        "requestPassword": requestPassword,
        "isActivated": isActivated,
        "isPhoneActivated": isPhoneActivated,
        "requireNote": requireNote,
        "timezone": timezone,
        "phoneAuth": phoneAuth,
        "isPhoneAuthActivated": isPhoneAuthActivated,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "deletedAt": deletedAt,
        "feedbacks": feedbacks == null
            ? null
            : List<dynamic>.from(feedbacks!.map((x) => x.toMap())),
        "courses": courses == null
            ? null
            : List<dynamic>.from(courses!.map((x) => x.toMap())),
      };
}

class Course {
  Course({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.level,
    required this.reason,
    required this.purpose,
    required this.otherDetails,
    required this.defaultPrice,
    required this.coursePrice,
    required this.courseType,
    required this.sectionType,
    required this.visible,
    required this.createdAt,
    required this.updatedAt,
    required this.tutorCourse,
  });

  String id;
  String name;
  String description;
  String imageUrl;
  String level;
  String reason;
  String purpose;
  String otherDetails;
  int defaultPrice;
  int coursePrice;
  dynamic courseType;
  dynamic sectionType;
  bool visible;
  DateTime createdAt;
  DateTime updatedAt;
  TutorCourse tutorCourse;

  factory Course.fromMap(Map<String, dynamic> json) => Course(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        imageUrl: json["imageUrl"],
        level: json["level"],
        reason: json["reason"],
        purpose: json["purpose"],
        otherDetails: json["other_details"],
        defaultPrice: json["default_price"],
        coursePrice: json["course_price"],
        courseType: json["courseType"],
        sectionType: json["sectionType"],
        visible: json["visible"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        tutorCourse: TutorCourse.fromMap(json["TutorCourse"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "description": description,
        "imageUrl": imageUrl,
        "level": level,
        "reason": reason,
        "purpose": purpose,
        "other_details": otherDetails,
        "default_price": defaultPrice,
        "course_price": coursePrice,
        "courseType": courseType,
        "sectionType": sectionType,
        "visible": visible,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "TutorCourse": tutorCourse.toMap(),
      };
}

class TutorCourse {
  TutorCourse({
    required this.userId,
    required this.courseId,
    required this.createdAt,
    required this.updatedAt,
  });

  String userId;
  String courseId;
  DateTime createdAt;
  DateTime updatedAt;

  factory TutorCourse.fromMap(Map<String, dynamic> json) => TutorCourse(
        userId: json["UserId"],
        courseId: json["CourseId"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toMap() => {
        "UserId": userId,
        "CourseId": courseId,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
      };
}
