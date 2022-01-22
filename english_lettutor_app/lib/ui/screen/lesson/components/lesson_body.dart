// ignore_for_file: avoid_print

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:english_lettutor_app/data/provider/profile_provider.dart';
import 'package:english_lettutor_app/generated/l10n.dart';
import 'package:english_lettutor_app/models/teacher/schedule.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:jitsi_meet/jitsi_meet.dart';
import 'package:provider/src/provider.dart';

class LessonBody extends StatefulWidget {
  const LessonBody({Key? key}) : super(key: key);

  @override
  _LessonBodyState createState() => _LessonBodyState();
}

class _LessonBodyState extends State<LessonBody> {
  late ProfileProvider profileProvider;
  late Schedule schedule;
  late Timer timer;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (schedule.time.start.millisecondsSinceEpoch <=
          DateTime.now().millisecondsSinceEpoch) {
        timer.cancel();
      } else {
        String strTimeUntil = getUntilTime(schedule.time.start);

        showDialog(
            context: context,
            builder: (context) {
              return Text(
                "$strTimeUntil\n ${S.current.until_lesson_starts} (${DateFormat("HH:mm, dd - MM - yyyy").format(schedule.time.start)})",
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.white, fontSize: 20),
                overflow: TextOverflow.clip,
              );
            });

        // Fluttertoast.showToast(
        //     msg:
        //         "$strTimeUntil\n ${S.current.until_lesson_starts} (${DateFormat("HH:mm, dd - MM - yyyy").format(schedule.time.start)})",
        //     toastLength: Toast.LENGTH_SHORT,
        //     gravity: ToastGravity.CENTER,
        //     timeInSecForIosWeb: 1,
        //     fontSize: 16.0);
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    timer.cancel();
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

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    profileProvider = context.read();
    schedule = ModalRoute.of(context)?.settings.arguments as Schedule;

    if (schedule.time.start.millisecondsSinceEpoch <=
        DateTime.now().millisecondsSinceEpoch) {
      timer.cancel();
    }

    _joinMeeting();

    return Container(
      color: Colors.black,
      child: Center(
        child: Stack(
          children: [
            Center(
              child: CircleAvatar(
                backgroundImage: NetworkImage(profileProvider.image!),
                radius: size.width * 0.25,
              ),
            ),
            Center(
              child: Container(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "strTimeUntil\n ${S.current.until_lesson_starts} (${DateFormat("HH:mm, dd - MM - yyyy").format(schedule.time.start)})",
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: Colors.white, fontSize: 20),
                      overflow: TextOverflow.clip,
                    ),
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(36),
                      color: Colors.black.withOpacity(0.3))),
            ),
          ],
        ),
      ),
    );
  }

  _joinMeeting() async {
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

      await JitsiMeet.joinMeeting(options);
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
}
