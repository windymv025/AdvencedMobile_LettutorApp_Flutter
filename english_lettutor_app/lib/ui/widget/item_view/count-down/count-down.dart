import 'dart:async';

import 'package:english_lettutor_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CountDownWidget extends StatefulWidget {
  const CountDownWidget({Key? key, required this.startTime}) : super(key: key);
  final DateTime startTime;
  @override
  _CountDownWidgetState createState() => _CountDownWidgetState();
}

class _CountDownWidgetState extends State<CountDownWidget> {
  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(seconds: 1), (timer) {
      if (widget.startTime.millisecondsSinceEpoch <=
          DateTime.now().millisecondsSinceEpoch) {
        timer.cancel();
        Navigator.of(context).pop();
      } else {
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    String strTimeUntil = getUntilTime(widget.startTime);
    return Container(
      color: Colors.black.withOpacity(0.5),
      child: Center(
        child: Text(
          "$strTimeUntil\n ${S.current.until_lesson_starts} (${DateFormat("HH:mm, dd - MM - yyyy").format(widget.startTime)})",
          textAlign: TextAlign.center,
          style: const TextStyle(color: Colors.white, fontSize: 20),
          overflow: TextOverflow.clip,
        ),
      ),
    );
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
}
