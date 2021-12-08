import 'package:english_lettutor_app/constants/assets.dart';
import 'package:english_lettutor_app/constants/constants.dart';
import 'package:english_lettutor_app/constants/design/styles.dart';
import 'package:english_lettutor_app/data/provider/teacher_dto.dart';
import 'package:english_lettutor_app/generated/l10n.dart';
import 'package:english_lettutor_app/models/teacher/schedule_history.dart';
import 'package:english_lettutor_app/models/teacher/teacher.dart';
import 'package:english_lettutor_app/ui/screen/messenger_detail/messenger_detail_screen.dart';
import 'package:english_lettutor_app/ui/screen/teacher_detail/teacher_detail_screen.dart';
import 'package:english_lettutor_app/ui/widget/item_list/my_list_tile.dart';
import 'package:english_lettutor_app/ui/widget/item_view/components/rating.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class ScheduleHistoryItem extends StatelessWidget {
  const ScheduleHistoryItem({Key? key, required this.scheduleHistory})
      : super(key: key);
  final ScheduleHistory scheduleHistory;

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    TeacherDTO teacherDTO = Provider.of<TeacherDTO>(context);
    Teacher teacher = teacherDTO.getTeacher(scheduleHistory.schedule.iDTeacher);
    return Container(
      decoration: BoxDecoration(
        boxShadow: isDark
            ? null
            : [
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
                avatar: AssetImage(teacher.uriImage != null
                    ? teacher.uriImage!
                    : Assets.assetsImagesUserIcon),
                title: Text(
                  teacher.name!,
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
                              .format(scheduleHistory.schedule.time.start),
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
                    scheduleHistory.ratingComment != null
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Rating(
                                  onRatingUpdate: null,
                                  rating:
                                      scheduleHistory.ratingComment!.rating ??
                                          0),
                              (scheduleHistory.ratingComment!.comment == null)
                                  ? const SizedBox.square()
                                  : Text(
                                      scheduleHistory.ratingComment!.comment!,
                                      overflow: TextOverflow.clip,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w800),
                                    ),
                            ],
                          )
                        : Container(),
                  ],
                ),
                trailing: Container(),
                onTap: () {
                  Navigator.pushNamed(context, TeacherDetailScreen.routeName,
                      arguments: teacher);
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
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        S.current.send_message,
                        style: const TextStyle(fontSize: textSizeButton),
                      ),
                    ),
                    style: outlineColorButtonStyle,
                  ),
                ),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        S.current.give_feedback,
                        style: const TextStyle(fontSize: textSizeButton),
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
