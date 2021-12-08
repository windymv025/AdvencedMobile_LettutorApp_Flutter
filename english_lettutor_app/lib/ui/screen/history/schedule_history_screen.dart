import 'package:english_lettutor_app/constants/constants.dart';
import 'package:english_lettutor_app/generated/l10n.dart';
import 'package:flutter/material.dart';

import 'components/schedule_history_body.dart';

class ScheduleHistoryScreen extends StatelessWidget {
  static String routeName = "/schedule_history";
  const ScheduleHistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          S.current.schedule_history,
          style: const TextStyle(
            fontSize: textSizePageName,
            color: Colors.white,
          ),
        ),
        backgroundColor: kMainBlueColor,
        foregroundColor: Colors.white,
      ),
      body: const ScheduleHistoryBody(),
    );
  }
}
