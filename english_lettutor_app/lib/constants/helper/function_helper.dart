import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:english_lettutor_app/generated/l10n.dart';
import 'package:english_lettutor_app/models/teacher/schedule.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:jitsi_meet/jitsi_meet.dart';

Timer? _timer;

String getStringTime(DateTime dateTime) {
  DateTime now = DateTime.now();
  DateTime temp = DateTime(
      now.year - dateTime.year,
      now.month - dateTime.month,
      now.day - dateTime.day,
      now.hour - dateTime.hour,
      now.minute - dateTime.minute,
      now.second - dateTime.second);
  String result = "";
  if (dateTime.year == now.year) {
    if (dateTime.month == now.month) {
      if (dateTime.day == now.day) {
        if (dateTime.hour == now.hour) {
          result = "${DateFormat("mm").format(temp)} ago";
        } else {
          result = "${DateFormat("HH:mm").format(temp)} ago";
        }
      } else {
        if (now.day - dateTime.day < 7) {
          result = DateFormat("EEE, HH:mm").format(dateTime);
        } else {
          result = DateFormat("MMM dd").format(dateTime);
        }
      }
    } else {
      result = DateFormat("MMM dd").format(dateTime);
    }
  } else {
    result = DateFormat("MMM dd, yyyy").format(dateTime);
  }

  return result;
}

Future joinMeeting(Schedule schedule) async {
  try {
    Map<FeatureFlagEnum, bool> featureFlags = {
      FeatureFlagEnum.WELCOME_PAGE_ENABLED: false,
    };
    if (!kIsWeb) {
      // Here is an example, disabling features for each platform
      if (Platform.isAndroid) {
        // Disable ConnectionService usage on Android to avoid issues (see README)
        featureFlags[FeatureFlagEnum.CALL_INTEGRATION_ENABLED] = false;
      } else if (Platform.isIOS) {
        // Disable PIP on iOS as it looks weird
        featureFlags[FeatureFlagEnum.PIP_ENABLED] = false;
      }
    }
    featureFlags[FeatureFlagEnum.CALL_INTEGRATION_ENABLED] = false;

    String? token = schedule.studentMeetingLink?.substring(13);
    dynamic roomId = json.decode(decodeBase64(token!.split(".")[1]))["room"];

    var options = JitsiMeetingOptions(
        room: roomId) // room is Required, spaces will be trimmed
      ..serverURL = "https://meet.lettutor.com"
      ..audioOnly = false
      ..audioMuted = false
      ..videoMuted = false
      ..token = token
      ..featureFlags.addAll(featureFlags);

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      String strTimeUntil = getUntilTime(schedule.time.start);

      if (schedule.time.start.millisecondsSinceEpoch <=
          DateTime.now().millisecondsSinceEpoch) {
        timer.cancel();
      } else {
        Fluttertoast.showToast(
            msg:
                "$strTimeUntil\n ${S.current.until_lesson_starts} (${DateFormat("HH:mm, dd - MM - yyyy").format(schedule.time.start)})",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.CENTER,
            backgroundColor: Colors.black,
            textColor: Colors.white,
            timeInSecForIosWeb: 1,
            fontSize: 16.0);
      }
    });

    await JitsiMeet.joinMeeting(options,
        listener: JitsiMeetingListener(
          onConferenceWillJoin: (data) {},
          onConferenceJoined: (data) {},
          onConferenceTerminated: (data) {
            Fluttertoast.cancel();
            if (_timer != null) {
              _timer!.cancel();
            }
          },
          onError: (data) {
            if (_timer != null) {
              _timer!.cancel();
            }
            Fluttertoast.cancel();
          },
        ));
  } catch (error) {
    debugPrint("error: $error");
  }
}

String decodeBase64(String toDecode) {
  String res;
  try {
    while (toDecode.length * 6 % 8 != 0) {
      toDecode += "=";
    }
    res = utf8.decode(base64.decode(toDecode));
  } catch (error) {
    throw Exception("decodeBase64([toDecode=$toDecode]) \n\t\terror: $error");
  }
  return res;
}

void joinJitsiMeet(BuildContext context, Schedule schedule) async {
  await joinMeeting(schedule);

  // showDialog(
  //     context: context,
  //     builder: (context) => CountDownWidget(startTime: schedule.time.start));
}

String getUntilTime(DateTime time) {
  final now = DateTime.now();
  final difference = time.difference(now);
  final days = difference.inDays;
  final hours = difference.inHours - days * 24;
  final minutes = difference.inMinutes - days * 24 * 60 - hours * 60;
  final seconds = difference.inSeconds -
      days * 24 * 60 * 60 -
      hours * 60 * 60 -
      minutes * 60;
  return "$days ${S.current.Days} $hours ${S.current.Hours} $minutes ${S.current.Minutes} $seconds ${S.current.Seconds}";
}
