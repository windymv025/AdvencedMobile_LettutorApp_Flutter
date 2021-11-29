import 'package:english_lettutor_app/constants/constants.dart';
import 'package:english_lettutor_app/constants/design/styles.dart';
import 'package:english_lettutor_app/models/teacher/schedule.dart';
import 'package:english_lettutor_app/ui/screen/lesson/lesson_screen.dart';
import 'package:english_lettutor_app/ui/screen/schedule/components/custom_gridview_schedule.dart';
import 'package:english_lettutor_app/ui/widget/item_view/bar/search_bar_title.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
    loadScheduleList();
    int hours = 12;
    int minutes = 10;
    Schedule schedule = Schedule.getDefault();
    return CustomScrollView(
      slivers: [
        SliverList(
            delegate: SliverChildListDelegate([
          SearchBarTitle(
            size: size,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Total lesson time is $hours hours $minutes minutes",
                  style: tileCountDownStyle,
                  overflow: TextOverflow.clip,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Upcoming lesson",
                  style: subTileCountDownStyle,
                  overflow: TextOverflow.clip,
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      DateFormat("EEE, dd MMM yy HH:mm")
                          .format((schedule.fromTime)),
                      style: subTileCountDownStyle,
                      overflow: TextOverflow.clip,
                    ),
                    const Text(
                      " - ",
                      style: subTileCountDownStyle,
                    ),
                    Text(
                      DateFormat("HH:mm").format((schedule.toTime)),
                      style: subTileCountDownStyle,
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  style: outlineButtonStyle,
                  onPressed: () {
                    Navigator.pushNamed(context, LessonScreen.routeName);
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Wrap(
                      spacing: 10,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: const [
                        Icon(
                          Icons.video_call_rounded,
                          color: kMainBlueColor,
                        ),
                        Text(
                          'Enter lesson room',
                          style: TextStyle(
                              color: Colors.blue,
                              fontSize: textSizeButton,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
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
