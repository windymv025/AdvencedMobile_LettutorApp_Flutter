import 'package:english_lettutor_app/constants/constants.dart';
import 'package:english_lettutor_app/constants/design/styles.dart';
import 'package:english_lettutor_app/data/provider/schedule_dto.dart';
import 'package:english_lettutor_app/models/teacher/schedule.dart';
import 'package:english_lettutor_app/ui/screen/lesson/lesson_screen.dart';
import 'package:english_lettutor_app/ui/screen/schedule/components/custom_gridview_schedule.dart';
import 'package:english_lettutor_app/ui/screen/schedule/components/upcoming_lession_search.dart';
import 'package:english_lettutor_app/ui/widget/item_view/bar/search_bar_title.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class ScheduleBody extends StatefulWidget {
  const ScheduleBody({Key? key}) : super(key: key);

  @override
  _ScheduleBodyState createState() => _ScheduleBodyState();
}

class _ScheduleBodyState extends State<ScheduleBody> {
  List<Schedule> schedules = [];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    int hours = 12;
    int minutes = 0;
    loadScheduleList();

    return CustomScrollView(
      slivers: [
        SliverList(
            delegate: SliverChildListDelegate([
          UpcomingLessionSearch(
              size: size,
              totalHours: hours,
              totalMinutes: minutes,
              // TODO: filter schedule
              schedule: Schedule.getDefault()),
          const SizedBox(
            height: 25,
          )
        ])),
        CustomGridViewSchedule(size: size, items: schedules)
      ],
    );
  }

  loadScheduleList() {
    schedules.add(Schedule.getDefault());
    schedules.add(Schedule.getDefault());
    schedules.add(Schedule.getDefault());
    schedules.add(Schedule.getDefault());
    schedules.add(Schedule.getDefault());
    schedules.add(Schedule.getDefault());
    schedules.add(Schedule.getDefault());
    schedules.add(Schedule.getDefault());
    schedules.add(Schedule.getDefault());
    schedules.add(Schedule.getDefault());
    schedules.add(Schedule.getDefault());
    schedules.add(Schedule.getDefault());
  }
}
