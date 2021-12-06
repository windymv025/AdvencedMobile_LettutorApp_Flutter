import 'dart:async';

import 'package:english_lettutor_app/constants/assets.dart';
import 'package:english_lettutor_app/constants/constants.dart';
import 'package:english_lettutor_app/models/teacher/schedule.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class LessonBody extends StatefulWidget {
  const LessonBody({Key? key}) : super(key: key);

  @override
  _LessonBodyState createState() => _LessonBodyState();
}

class _LessonBodyState extends State<LessonBody> {
  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {});
    });
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
    return "$days Days $hours Hours $minutes Minutes $seconds Seconds";
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Schedule schedule = ModalRoute.of(context)?.settings.arguments as Schedule;
    String strTimeUntil = getUntilTime(schedule.time.start);

    return Container(
      color: Colors.black,
      child: Center(
        child: Stack(
          children: [
            Center(
              child: CircleAvatar(
                backgroundImage:
                    const AssetImage(Assets.assetsImagesNoDataFound),
                radius: size.width * 0.25,
              ),
            ),
            Center(
              child: Container(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "$strTimeUntil\n until lesson start (${DateFormat("HH:mm, dd - MM - yyyy").format(schedule.time.start)})",
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
}
