import 'dart:async';
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
      setState(() {});
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
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

    String strTimeUntil = getUntilTime(schedule.time.start);
    if (schedule.time.start.millisecondsSinceEpoch <=
        DateTime.now().millisecondsSinceEpoch) {
      _joinMeeting();

      timer.cancel();
    }

    Fluttertoast.showToast(
        msg:
            "$strTimeUntil\n ${S.current.until_lesson_starts} (${DateFormat("HH:mm, dd - MM - yyyy").format(schedule.time.start)})",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 2,
        fontSize: 16.0);
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
                      "$strTimeUntil\n ${S.current.until_lesson_starts} (${DateFormat("HH:mm, dd - MM - yyyy").format(schedule.time.start)})",
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
      // featureFlags[FeatureFlagEnum.WELCOME_PAGE_ENABLED] = false;
      featureFlags[FeatureFlagEnum.CALL_INTEGRATION_ENABLED] = false;

      String? token = schedule.studentMeetingLink?.substring(13);
      String room = schedule.scheduleDetailId!;
      String displayName = profileProvider.fullName;
      String? avatarUrl = profileProvider.image;

      debugPrint(token);

      var options = JitsiMeetingOptions(
          room: room) // room is Required, spaces will be trimmed
        // ..serverURL = "https://meet.tutoring.letstudy.io"
        ..serverURL = "https://meet.lettutor.com"
        ..userDisplayName = displayName
        ..userAvatarURL = avatarUrl
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
}
