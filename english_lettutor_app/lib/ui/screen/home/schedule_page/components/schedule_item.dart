import 'package:english_lettutor_app/constants/constants.dart';
import 'package:english_lettutor_app/constants/design/styles.dart';
import 'package:english_lettutor_app/data/provider/schedule_dto.dart';
import 'package:english_lettutor_app/data/provider/teacher_dto.dart';
import 'package:english_lettutor_app/generated/l10n.dart';
import 'package:english_lettutor_app/models/teacher/schedule.dart';
import 'package:english_lettutor_app/models/teacher/teacher.dart';
import 'package:english_lettutor_app/ui/screen/lesson/lesson_screen.dart';
import 'package:english_lettutor_app/ui/screen/teacher_detail/teacher_detail_screen.dart';
import 'package:english_lettutor_app/ui/widget/item_list/my_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class ScheduleItem extends StatelessWidget {
  const ScheduleItem({Key? key, required this.schedule}) : super(key: key);
  final Schedule schedule;
  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    ScheduleDTO scheduleDTO = Provider.of<ScheduleDTO>(context);
    Teacher? teacher = schedule.teacher;

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
          mainAxisSize: MainAxisSize.min,
          children: [
            MyListTile(
                avatar: teacher?.uriImage != null
                    ? NetworkImage(teacher!.uriImage!)
                    : null,
                title: Text(
                  teacher!.name.toString(),
                  style: titleStyle,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
                subtitle: Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    Text(
                      DateFormat("yyyy-MM-dd").format(schedule.time.start),
                      style: const TextStyle(fontWeight: FontWeight.w800),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: kMainBlueColor.withOpacity(0.2),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(7)),
                      ),
                      child: Text(
                        DateFormat("HH:mm").format(schedule.time.start),
                        style: const TextStyle(color: kMainBlueColor),
                      ),
                    ),
                    const Text(
                      "-",
                      style: TextStyle(fontWeight: FontWeight.w800),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        color: Colors.red.withOpacity(0.2),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(7)),
                      ),
                      padding: const EdgeInsets.all(4),
                      child: Text(DateFormat("HH:mm").format(schedule.time.end),
                          style: const TextStyle(color: Colors.red)),
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
                  child: OutlinedButton(
                    onPressed: () {
                      if (schedule.time.start
                              .difference(DateTime.now())
                              .inHours >
                          2) {
                        scheduleDTO.cancelSchedule(schedule.scheduleDetailId!);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(S.current.just_cancel_before_2_hours),
                        ));
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        S.current.cancel,
                        style: const TextStyle(fontSize: textSizeButton),
                      ),
                    ),
                    style: outlineColorButtonStyle,
                  ),
                ),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, LessonScreen.routeName,
                          arguments: schedule);
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        S.current.enter_lesson_room,
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
