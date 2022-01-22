class Profile {
  Profile({
    this.id,
    this.email,
    this.name,
    this.avatar,
    this.country,
    this.phone,
    this.roles,
    this.language,
    this.birthday,
    this.isActivated,
    this.tutorInfo,
    this.walletInfo,
    this.feedbacks,
    this.courses,
    this.requireNote,
    this.level,
    this.learnTopics,
    this.testPreparations,
    this.isPhoneActivated,
    this.timezone,
    this.referralInfo,
    this.avgRating,
    this.priceOfEachSession,
  });

  String? id;
  String? email;
  String? name;
  String? avatar;
  String? country;
  String? phone;
  List<String>? roles;
  dynamic language;
  DateTime? birthday;
  bool? isActivated;
  dynamic tutorInfo;
  WalletInfo? walletInfo;
  List<dynamic>? feedbacks;
  List<dynamic>? courses;
  dynamic requireNote;
  dynamic level;
  List<LearnTopic>? learnTopics;
  List<LearnTopic>? testPreparations;
  bool? isPhoneActivated;
  int? timezone;
  ReferralInfo? referralInfo;
  int? avgRating;
  PriceOfEachSession? priceOfEachSession;

  factory Profile.fromMapSimple(Map<String, dynamic> json) => Profile(
        id: json["id"],
        email: json["email"],
        name: json["name"],
        avatar: json["avatar"],
      );

  factory Profile.fromMap(Map<String, dynamic> json) => Profile(
        id: json["id"],
        email: json["email"],
        name: json["name"],
        avatar: json["avatar"],
        country: json["country"],
        phone: json["phone"],
        roles: List<String>.from(json["roles"].map((x) => x)),
        language: json["language"],
        birthday: json["birthday"] != null
            ? DateTime.parse(json["birthday"] as String).toLocal()
            : null,
        isActivated: json["isActivated"],
        tutorInfo: json["tutorInfo"],
        walletInfo: json["walletInfo"] == null
            ? null
            : WalletInfo.fromMap(json["walletInfo"]),
        feedbacks: json["feedbacks"] == null
            ? null
            : List<dynamic>.from(json["feedbacks"].map((x) => x)),
        courses: json["courses"] == null
            ? null
            : List<dynamic>.from(json["courses"].map((x) => x)),
        requireNote: json["requireNote"],
        level: json["level"],
        learnTopics: json["learnTopics"] == null
            ? null
            : List<LearnTopic>.from(
                json["learnTopics"].map((x) => LearnTopic.fromMap(x))),
        testPreparations: json["testPreparations"] == null
            ? null
            : List<LearnTopic>.from(
                json["testPreparations"].map((x) => LearnTopic.fromMap(x))),
        isPhoneActivated: json["isPhoneActivated"],
        timezone: json["timezone"],
        referralInfo: json["referralInfo"] == null
            ? null
            : ReferralInfo.fromMap(json["referralInfo"]),
        avgRating: json["avgRating"],
        priceOfEachSession: json["priceOfEachSession"] == null
            ? null
            : PriceOfEachSession.fromMap(json["priceOfEachSession"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "email": email,
        "name": name,
        "avatar": avatar,
        "country": country,
        "phone": phone,
        "roles": roles,
        "language": language,
        "birthday": birthday,
        "isActivated": isActivated,
        "tutorInfo": tutorInfo,
        "walletInfo": walletInfo?.toMap(),
        "feedbacks": feedbacks,
        "courses": courses,
        "requireNote": requireNote,
        "level": level,
        "learnTopics": learnTopics,
        "testPreparations": testPreparations,
        "isPhoneActivated": isPhoneActivated,
        "timezone": timezone,
        "referralInfo": referralInfo?.toMap(),
        "avgRating": avgRating,
        "priceOfEachSession": priceOfEachSession?.toMap(),
      };
}

class LearnTopic {
  LearnTopic({
    required this.id,
    required this.key,
    required this.name,
  });

  int id;
  String key;
  String name;

  factory LearnTopic.fromMap(Map<String, dynamic> json) => LearnTopic(
        id: json["id"],
        key: json["key"],
        name: json["name"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "key": key,
        "name": name,
      };
}

class PriceOfEachSession {
  PriceOfEachSession({
    required this.id,
    required this.key,
    required this.price,
    required this.createdAt,
    required this.updatedAt,
  });

  late String id;
  late String key;
  late String price;
  late DateTime createdAt;
  late DateTime updatedAt;

  factory PriceOfEachSession.fromMap(Map<String, dynamic> json) =>
      PriceOfEachSession(
        id: json["id"],
        key: json["key"],
        price: json["price"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "key": key,
        "price": price,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
      };
}

class ReferralInfo {
  ReferralInfo({
    required this.id,
    required this.referralCode,
    required this.userId,
    required this.referralPackId,
    required this.createdAt,
    required this.updatedAt,
    required this.referralPackInfo,
  });

  late int id;
  late String referralCode;
  late String userId;
  late int referralPackId;
  late DateTime createdAt;
  late DateTime updatedAt;
  late ReferralPackInfo referralPackInfo;

  factory ReferralInfo.fromMap(Map<String, dynamic> json) => ReferralInfo(
        id: json["id"],
        referralCode: json["referralCode"],
        userId: json["userId"],
        referralPackId: json["referralPackId"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        referralPackInfo: ReferralPackInfo.fromMap(json["referralPackInfo"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "referralCode": referralCode,
        "userId": userId,
        "referralPackId": referralPackId,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "referralPackInfo": referralPackInfo.toMap(),
      };
}

class ReferralPackInfo {
  ReferralPackInfo({
    this.id,
    this.earnPercent,
    this.isActive,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  int? earnPercent;
  bool? isActive;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory ReferralPackInfo.fromMap(Map<String, dynamic> json) =>
      ReferralPackInfo(
        id: json["id"],
        earnPercent: json["earnPercent"],
        isActive: json["isActive"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "earnPercent": earnPercent,
        "isActive": isActive,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
      };
}

class WalletInfo {
  WalletInfo({
    this.id,
    this.userId,
    this.amount,
    this.isBlocked,
    this.createdAt,
    this.updatedAt,
    this.bonus,
  });

  String? id;
  String? userId;
  String? amount;
  bool? isBlocked;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? bonus;

  factory WalletInfo.fromMap(Map<String, dynamic> json) => WalletInfo(
        id: json["id"],
        userId: json["userId"],
        amount: json["amount"],
        isBlocked: json["isBlocked"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        bonus: json["bonus"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "userId": userId,
        "amount": amount,
        "isBlocked": isBlocked,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "bonus": bonus,
      };
}
