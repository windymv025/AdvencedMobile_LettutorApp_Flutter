import 'package:english_lettutor_app/models/teacher/schedule.dart';
import 'package:english_lettutor_app/models/teacher/schedule_history.dart';
import 'package:english_lettutor_app/models/teacher/teacher.dart';
import 'package:flutter/material.dart';

class MyScheduleList {
  MyScheduleList({
    this.count,
    this.rows,
  });

  int? count;
  List<ScheduleItem>? rows;

  factory MyScheduleList.fromMap(Map<String, dynamic> json) => MyScheduleList(
        count: json["count"],
        rows: json["rows"] == null
            ? null
            : List<ScheduleItem>.from(
                json["rows"].map((x) => ScheduleItem.fromMap(x))),
      );

  List<Schedule> getScheduleList() {
    List<Schedule> scheduleList = [];
    rows?.forEach((e) {
      if (e.scheduleDetailInfo!.startPeriodTimestamp! >
          DateTime.now().millisecondsSinceEpoch) {
        DateTimeRange dateTimeRange = DateTimeRange(
          start: DateTime.fromMillisecondsSinceEpoch(
                  e.scheduleDetailInfo!.startPeriodTimestamp!)
              .toLocal(),
          end: DateTime.fromMillisecondsSinceEpoch(
                  e.scheduleDetailInfo!.endPeriodTimestamp!)
              .toLocal(),
        );
        scheduleList.add(Schedule(
          iDTeacher: e.scheduleDetailInfo?.scheduleInfo?.tutorInfo?.id,
          time: dateTimeRange,
          iDStudent: e.userId,
          scheduleDetailId: e.scheduleDetailId,
          studentMeetingLink: e.studentMeetingLink,
          tutorMeetingLink: e.tutorMeetingLink,
          teacher: Teacher(
            id: e.scheduleDetailInfo!.scheduleInfo!.tutorInfo!.id!,
            name: e.scheduleDetailInfo!.scheduleInfo!.tutorInfo!.name!,
            uriImage: e.scheduleDetailInfo!.scheduleInfo!.tutorInfo!.avatar!,
            country: e.scheduleDetailInfo!.scheduleInfo!.tutorInfo!.country!,
            description: "",
            specialties: [],
            uriVideo: '',
          ),
        ));
      }
    });
    return scheduleList;
  }

  List<Schedule> getScheduleHistoryList() {
    List<Schedule> scheduleList = [];
    rows?.forEach((e) {
      DateTimeRange dateTimeRange = DateTimeRange(
        start: DateTime.fromMillisecondsSinceEpoch(
                e.scheduleDetailInfo!.startPeriodTimestamp!)
            .toLocal(),
        end: DateTime.fromMillisecondsSinceEpoch(
                e.scheduleDetailInfo!.endPeriodTimestamp!)
            .toLocal(),
      );
      scheduleList.add(Schedule(
        iDTeacher: e.scheduleDetailInfo?.scheduleInfo?.tutorInfo?.id,
        time: dateTimeRange,
        iDStudent: e.userId,
        scheduleDetailId: e.scheduleDetailId,
        studentMeetingLink: e.studentMeetingLink,
        tutorMeetingLink: e.tutorMeetingLink,
        teacher: Teacher(
          id: e.scheduleDetailInfo!.scheduleInfo!.tutorInfo!.id!,
          name: e.scheduleDetailInfo!.scheduleInfo!.tutorInfo!.name!,
          uriImage: e.scheduleDetailInfo!.scheduleInfo!.tutorInfo!.avatar!,
          country: e.scheduleDetailInfo!.scheduleInfo!.tutorInfo!.country!,
          description: "",
          specialties: [],
          uriVideo: '',
        ),
      ));
    });
    return scheduleList;
  }
}

class ScheduleItem {
  ScheduleItem({
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
    this.scheduleDetailInfo,
    this.showRecordUrl,
    this.studentMaterials,
  });

  int? createdAtTimeStamp;
  int? updatedAtTimeStamp;
  String? id;
  String? userId;
  String? scheduleDetailId;
  String? tutorMeetingLink;
  String? studentMeetingLink;
  dynamic studentRequest;
  dynamic tutorReview;
  dynamic scoreByTutor;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic recordUrl;
  bool? isDeleted;
  ScheduleDetailInfo? scheduleDetailInfo;
  bool? showRecordUrl;
  List<dynamic>? studentMaterials;

  factory ScheduleItem.fromMap(Map<String, dynamic> json) => ScheduleItem(
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
        scheduleDetailInfo: json["scheduleDetailInfo"] == null
            ? null
            : ScheduleDetailInfo.fromMap(json["scheduleDetailInfo"]),
        showRecordUrl: json["showRecordUrl"],
        studentMaterials: json["studentMaterials"] == null
            ? null
            : List<dynamic>.from(json["studentMaterials"].map((x) => x)),
      );
}

class ScheduleDetailInfo {
  ScheduleDetailInfo({
    this.startPeriodTimestamp,
    this.endPeriodTimestamp,
    this.id,
    this.scheduleId,
    this.startPeriod,
    this.endPeriod,
    this.createdAt,
    this.updatedAt,
    this.scheduleInfo,
  });

  int? startPeriodTimestamp;
  int? endPeriodTimestamp;
  String? id;
  String? scheduleId;
  String? startPeriod;
  String? endPeriod;
  DateTime? createdAt;
  DateTime? updatedAt;
  ScheduleInfo? scheduleInfo;

  factory ScheduleDetailInfo.fromMap(Map<String, dynamic> json) =>
      ScheduleDetailInfo(
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
        scheduleInfo: json["scheduleInfo"] == null
            ? null
            : ScheduleInfo.fromMap(json["scheduleInfo"]),
      );
}

class ScheduleInfo {
  ScheduleInfo({
    this.date,
    this.startTimestamp,
    this.endTimestamp,
    this.id,
    this.tutorId,
    this.startTime,
    this.endTime,
    this.createdAt,
    this.updatedAt,
    this.tutorInfo,
  });

  DateTime? date;
  int? startTimestamp;
  int? endTimestamp;
  String? id;
  String? tutorId;
  String? startTime;
  String? endTime;
  DateTime? createdAt;
  DateTime? updatedAt;
  TutorInfo? tutorInfo;

  factory ScheduleInfo.fromMap(Map<String, dynamic> json) => ScheduleInfo(
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        startTimestamp: json["startTimestamp"],
        endTimestamp: json["endTimestamp"],
        id: json["id"],
        tutorId: json["tutorId"],
        startTime: json["startTime"],
        endTime: json["endTime"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        tutorInfo: json["tutorInfo"] == null
            ? null
            : TutorInfo.fromMap(json["tutorInfo"]),
      );
}

class TutorInfo {
  TutorInfo({
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
  dynamic language;
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

  factory TutorInfo.fromMap(Map<String, dynamic> json) => TutorInfo(
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
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        deletedAt: json["deletedAt"],
      );
}
