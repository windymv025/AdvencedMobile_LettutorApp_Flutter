class JitsiModel {
  JitsiModel({
    required this.context,
    required this.room,
    required this.roomName,
    required this.userCall,
    required this.userBeCalled,
    required this.isTutor,
    required this.startTime,
    required this.endSession,
    required this.timeInRoom,
    required this.bookingId,
    required this.iat,
    required this.exp,
    required this.aud,
    required this.iss,
    required this.sub,
  });

  Context context;
  String? room;
  String? roomName;
  UserBeCalledClass? userCall;
  UserBeCalledClass? userBeCalled;
  bool isTutor;
  int? startTime;
  int? endSession;
  int? timeInRoom;
  String? bookingId;
  int? iat;
  int? exp;
  String? aud;
  String? iss;
  String? sub;

  factory JitsiModel.fromMap(Map<String, dynamic> json) => JitsiModel(
        context: Context.fromMap(json["context"]),
        room: json["room"],
        roomName: json["roomName"],
        userCall: UserBeCalledClass.fromMap(json["userCall"]),
        userBeCalled: UserBeCalledClass.fromMap(json["userBeCalled"]),
        isTutor: json["isTutor"],
        startTime: json["startTime"],
        endSession: json["endSession"],
        timeInRoom: json["timeInRoom"],
        bookingId: json["bookingId"],
        iat: json["iat"],
        exp: json["exp"],
        aud: json["aud"],
        iss: json["iss"],
        sub: json["sub"],
      );
}

class Context {
  Context({
    required this.user,
  });

  User user;

  factory Context.fromMap(Map<String, dynamic> json) => Context(
        user: User.fromMap(json["user"]),
      );

  Map<String, dynamic> toMap() => {
        "user": user.toMap(),
      };
}

class User {
  User({
    required this.email,
    required this.name,
  });

  String? email;
  String? name;

  factory User.fromMap(Map<String, dynamic> json) => User(
        email: json["email"],
        name: json["name"],
      );

  Map<String, dynamic> toMap() => {
        "email": email,
        "name": name,
      };
}

class UserBeCalledClass {
  UserBeCalledClass({
    required this.id,
    required this.email,
    required this.name,
    required this.avatar,
    required this.country,
    required this.phone,
    required this.language,
    required this.birthday,
    required this.isActivated,
    required this.tutorInfo,
    required this.requireNote,
    required this.level,
    required this.isPhoneActivated,
    required this.timezone,
  });

  String? id;
  String? email;
  String? name;
  String? avatar;
  String? country;
  String? phone;
  dynamic language;
  DateTime? birthday;
  bool? isActivated;
  TutorInfo? tutorInfo;
  String? requireNote;
  String? level;
  bool? isPhoneActivated;
  int? timezone;

  factory UserBeCalledClass.fromMap(Map<String, dynamic> json) =>
      UserBeCalledClass(
        id: json["id"],
        email: json["email"],
        name: json["name"],
        avatar: json["avatar"],
        country: json["country"],
        phone: json["phone"],
        language: json["language"],
        birthday: DateTime.parse(json["birthday"]),
        isActivated: json["isActivated"],
        tutorInfo: TutorInfo.fromMap(json["tutorInfo"]),
        requireNote: json["requireNote"],
        level: json["level"],
        isPhoneActivated: json["isPhoneActivated"],
        timezone: json["timezone"],
      );
}

class TutorInfo {
  TutorInfo({
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
  bool isActivated;
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
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
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
