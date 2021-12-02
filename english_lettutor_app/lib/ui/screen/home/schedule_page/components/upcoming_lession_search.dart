import 'package:english_lettutor_app/constants/constants.dart';
import 'package:english_lettutor_app/constants/design/styles.dart';
import 'package:english_lettutor_app/data/provider/schedule_dto.dart';
import 'package:english_lettutor_app/models/teacher/schedule.dart';
import 'package:english_lettutor_app/ui/screen/lesson/lesson_screen.dart';
import 'package:english_lettutor_app/ui/widget/item_view/bar/search_bar_title.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/src/provider.dart';

class UpcomingLessionSearch extends StatefulWidget {
  const UpcomingLessionSearch({Key? key, required this.schedule})
      : super(key: key);
  final Schedule? schedule;

  @override
  _UpcomingLessionSearchState createState() => _UpcomingLessionSearchState();
}

class _UpcomingLessionSearchState extends State<UpcomingLessionSearch> {
  @override
  Widget build(BuildContext context) {
    Schedule? schedule = widget.schedule;
    final ScheduleDTO scheduleDTO = context.watch<ScheduleDTO>();
    return SearchBarTitle(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Total lesson time is ${scheduleDTO.getTotalTimeStudy()}",
            style: tileCountDownStyle,
            overflow: TextOverflow.clip,
            textAlign: TextAlign.center,
          ),
          schedule != null
              ? Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: const Text(
                    "Upcoming lesson",
                    style: subTileCountDownStyle,
                    overflow: TextOverflow.clip,
                  ),
                )
              : Container(),
          schedule != null
              ? Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: Row(
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
                )
              : Container(),
          const SizedBox(
            height: 10,
          ),
          schedule != null
              ? ElevatedButton(
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
                )
              : Container(),
        ],
      ),
    );
  }
}