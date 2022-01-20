import 'package:english_lettutor_app/constants/constants.dart';
import 'package:english_lettutor_app/constants/design/styles.dart';
import 'package:english_lettutor_app/generated/l10n.dart';
import 'package:english_lettutor_app/models/teacher/schedule.dart';
import 'package:english_lettutor_app/models/teacher/teacher.dart';
import 'package:english_lettutor_app/ui/screen/teacher_detail/teacher_detail_screen.dart';
import 'package:english_lettutor_app/ui/widget/item_list/my_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ScheduleHistoryItem extends StatelessWidget {
  const ScheduleHistoryItem({Key? key, required this.scheduleHistory})
      : super(key: key);
  final Schedule scheduleHistory;

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    Teacher teacher = scheduleHistory.teacher!;
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
                avatar: NetworkImage(teacher.uriImage!),
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
                              .format(scheduleHistory.time.start),
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
                          scheduleHistory.time.duration
                              .toString()
                              .split('.')[0],
                          style: const TextStyle(fontWeight: FontWeight.w800),
                        ),
                      ],
                    ),
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
