import 'package:english_lettutor_app/constants/constants.dart';
import 'package:english_lettutor_app/constants/design/styles.dart';
import 'package:english_lettutor_app/models/teacher/schedule_history.dart';
import 'package:english_lettutor_app/ui/screen/messenger_detail/messenger_detail_screen.dart';
import 'package:english_lettutor_app/ui/screen/teacher_detail/teacher_detail_screen.dart';
import 'package:english_lettutor_app/ui/widget/item_list/my_list_tile.dart';
import 'package:english_lettutor_app/ui/widget/item_view/components/rating.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ScheduleHistoryItem extends StatelessWidget {
  const ScheduleHistoryItem({Key? key, required this.scheduleHistory})
      : super(key: key);
  final ScheduleHistory scheduleHistory;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            blurRadius: 5,
            color: kPrimaryColor.withOpacity(0.25),
          ),
        ],
      ),
      child: Card(
        child: Column(
          children: [
            MyListTile(
                avatar: AssetImage(scheduleHistory.schedule.teacher.uriImage!),
                title: Text(
                  scheduleHistory.schedule.teacher.name!,
                  style: titleStyle,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    //Start time
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Icon(Icons.calendar_today_rounded),
                        const SizedBox(width: 15),
                        Text(
                          DateFormat("EEE, dd-MM-yyyy HH:mm:ss")
                              .format(scheduleHistory.schedule.fromTime),
                          style: const TextStyle(fontWeight: FontWeight.w800),
                        ),
                      ],
                    ),
                    //Total time
                    const SizedBox(
                      height: 10,
                    ),

                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Icon(Icons.schedule_rounded),
                        const SizedBox(width: 15),
                        Text(
                          DateFormat("HH:mm:ss").format(
                              DateTime.fromMillisecondsSinceEpoch(
                                  scheduleHistory.countTime)),
                          style: const TextStyle(fontWeight: FontWeight.w800),
                        ),
                      ],
                    ),
                    //Rating and comment
                    const SizedBox(
                      height: 10,
                    ),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Rating(
                            onRatingUpdate: null,
                            rating: scheduleHistory.ratingComment.rating ?? 0),
                        (scheduleHistory.ratingComment.comment == null)
                            ? const SizedBox.square()
                            : Text(
                                scheduleHistory.ratingComment.comment!,
                                overflow: TextOverflow.clip,
                                style: const TextStyle(
                                    fontWeight: FontWeight.w800),
                              ),
                      ],
                    ),
                  ],
                ),
                trailing: Container(),
                onTap: () {
                  Navigator.pushNamed(context, TeacherDetailScreen.routeName);
                },
                color: Colors.white),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.pushNamed(
                          context, MessengerDetailScreen.routeName);
                    },
                    child: const Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        "Send message",
                        style: TextStyle(fontSize: textSizeButton),
                      ),
                    ),
                    style: outlineColorButtonStyle,
                  ),
                ),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        "Give Feedback",
                        style: TextStyle(fontSize: textSizeButton),
                      ),
                    ),
                    style: defaultColorButtonStyle,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
