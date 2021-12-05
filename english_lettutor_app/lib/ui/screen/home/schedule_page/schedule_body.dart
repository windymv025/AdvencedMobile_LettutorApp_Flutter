import 'package:english_lettutor_app/data/provider/schedule_dto.dart';
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
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    // final ScheduleDTO scheduleDTO = context.watch<ScheduleDTO>();

    return Consumer<ScheduleDTO>(builder: (context, scheduleDTO, _) {
      return CustomScrollView(
        slivers: [
          SliverList(
              delegate: SliverChildListDelegate([
            UpcomingLessionSearch(
              schedule: scheduleDTO.getUpcomingLessionSchedule(),
            ),
          ])),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 20),
            sliver: CustomGridViewSchedule(
                size: size, items: scheduleDTO.getAvailableSchedule()),
          )
        ],
      );
    });
  }
}
