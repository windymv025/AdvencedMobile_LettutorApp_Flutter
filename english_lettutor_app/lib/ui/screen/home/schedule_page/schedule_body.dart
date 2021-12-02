import 'package:english_lettutor_app/data/provider/schedule_dto.dart';
import 'package:english_lettutor_app/models/teacher/schedule.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'components/custom_gridview_schedule.dart';
import 'components/upcoming_lession_search.dart';

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

    // final ScheduleDTO scheduleDTO = context.watch<ScheduleDTO>();

    return Consumer<ScheduleDTO>(builder: (context, scheduleDTO, _) {
      return CustomScrollView(
        slivers: [
          SliverList(
              delegate: SliverChildListDelegate([
            UpcomingLessionSearch(
              schedule: scheduleDTO.getUpcomingLessionSchedule(),
            ),
            const SizedBox(
              height: 25,
            )
          ])),
          CustomGridViewSchedule(size: size, items: scheduleDTO.items)
        ],
      );
    });
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
