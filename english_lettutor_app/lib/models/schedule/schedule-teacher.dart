class ScheduleTeacher {
  ScheduleTeacher({
    this.id,
    this.tutorId,
    this.startTime,
    this.endTime,
    this.startTimestamp,
    this.endTimestamp,
    this.createdAt,
    this.isBooked,
    this.scheduleDetails,
  });

  String? id;
  String? tutorId;
  String? startTime;
  String? endTime;
  int? startTimestamp;
  int? endTimestamp;
  DateTime? createdAt;
  bool? isBooked;
  List<ScheduleDetail>? scheduleDetails;

  factory ScheduleTeacher.fromMap(Map<String, dynamic> json) => ScheduleTeacher(
        id: json["id"],
        tutorId: json["tutorId"],
        startTime: json["startTime"],
        endTime: json["endTime"],
        startTimestamp: json["startTimestamp"],
        endTimestamp: json["endTimestamp"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        isBooked: json["isBooked"],
        scheduleDetails: json["scheduleDetails"] == null
            ? null
            : List<ScheduleDetail>.from(
                json["scheduleDetails"].map((x) => ScheduleDetail.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "tutorId": tutorId,
        "startTime": startTime,
        "endTime": endTime,
        "startTimestamp": startTimestamp,
        "endTimestamp": endTimestamp,
        "createdAt": createdAt?.toIso8601String(),
        "isBooked": isBooked,
        "scheduleDetails": scheduleDetails == null
            ? null
            : List<dynamic>.from(scheduleDetails!.map((x) => x.toMap())),
      };
}

class ScheduleDetail {
  ScheduleDetail({
    this.startPeriodTimestamp,
    this.endPeriodTimestamp,
    this.id,
    this.scheduleId,
    this.startPeriod,
    this.endPeriod,
    this.createdAt,
    this.updatedAt,
    this.bookingInfo,
    this.isBooked,
  });

  int? startPeriodTimestamp;
  int? endPeriodTimestamp;
  String? id;
  String? scheduleId;
  String? startPeriod;
  String? endPeriod;
  DateTime? createdAt;
  DateTime? updatedAt;
  List<BookingInfo>? bookingInfo;
  bool? isBooked;

  factory ScheduleDetail.fromMap(Map<String, dynamic> json) => ScheduleDetail(
        startPeriodTimestamp: json["startPeriodTimestamp"],
        endPeriodTimestamp: json["endPeriodTimestamp"],
        id: json["id"],
        scheduleId: json["scheduleId"],
        startPeriod: json["startPeriod"],
        endPeriod: json["endPeriod"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        bookingInfo: json["bookingInfo"] == null
            ? null
            : List<BookingInfo>.from(
                json["bookingInfo"].map((x) => BookingInfo.fromMap(x))),
        isBooked: json["isBooked"],
      );

  Map<String, dynamic> toMap() => {
        "startPeriodTimestamp": startPeriodTimestamp,
        "endPeriodTimestamp": endPeriodTimestamp,
        "id": id,
        "scheduleId": scheduleId,
        "startPeriod": startPeriod,
        "endPeriod": endPeriod,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "bookingInfo": bookingInfo == null
            ? null
            : List<dynamic>.from(bookingInfo!.map((x) => x.toMap())),
        "isBooked": isBooked,
      };
}

class BookingInfo {
  BookingInfo({
    this.createdAtTimeStamp,
    this.updatedAtTimeStamp,
    this.id,
    this.userId,
    this.scheduleDetailId,
    this.tutorMeetingLink,
    this.studentMeetingLink,
    this.studentRequest,
    this.tutorReview,
    this.scoreByTutor,
    this.createdAt,
    this.updatedAt,
    this.recordUrl,
    this.isDeleted,
  });

  int? createdAtTimeStamp;
  int? updatedAtTimeStamp;
  String? id;
  String? userId;
  String? scheduleDetailId;
  String? tutorMeetingLink;
  String? studentMeetingLink;
  String? studentRequest;
  String? tutorReview;
  int? scoreByTutor;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? recordUrl;
  bool? isDeleted;

  factory BookingInfo.fromMap(Map<String, dynamic> json) => BookingInfo(
        createdAtTimeStamp: json["createdAtTimeStamp"],
        updatedAtTimeStamp: json["updatedAtTimeStamp"],
        id: json["id"],
        userId: json["userId"],
        scheduleDetailId: json["scheduleDetailId"],
        tutorMeetingLink: json["tutorMeetingLink"],
        studentMeetingLink: json["studentMeetingLink"],
        studentRequest: json["studentRequest"],
        tutorReview: json["tutorReview"],
        scoreByTutor: json["scoreByTutor"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        recordUrl: json["recordUrl"],
        isDeleted: json["isDeleted"],
      );

  Map<String, dynamic> toMap() => {
        "createdAtTimeStamp": createdAtTimeStamp,
        "updatedAtTimeStamp": updatedAtTimeStamp,
        "id": id,
        "userId": userId,
        "scheduleDetailId": scheduleDetailId,
        "tutorMeetingLink": tutorMeetingLink,
        "studentMeetingLink": studentMeetingLink,
        "studentRequest": studentRequest,
        "tutorReview": tutorReview,
        "scoreByTutor": scoreByTutor,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "recordUrl": recordUrl,
        "isDeleted": isDeleted,
      };
}
