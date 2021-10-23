import 'package:english_lettutor_app/models/schedule.dart';
import 'package:english_lettutor_app/ui/screen/teacher_detail/teacher_detail_screen.dart';
import 'package:english_lettutor_app/ui/widget/item_list/my_list_tile.dart';
import 'package:english_lettutor_app/utilities/constants/constants.dart';
import 'package:english_lettutor_app/utilities/design/styles.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ScheduleItem extends StatelessWidget {
  const ScheduleItem({Key? key, required this.schedule}) : super(key: key);
  final Schedule schedule;
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
                avatar: AssetImage(schedule.teacher.uriImage!),
                title: Text(
                  schedule.teacher.name!,
                  style: titleStyle,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
                subtitle: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      DateFormat("yyyy-MM-dd").format(schedule.fromTime),
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
                        DateFormat("HH:mm").format(schedule.fromTime),
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
                      child: Text(DateFormat("HH:mm").format(schedule.toTime),
                          style: const TextStyle(color: Colors.red)),
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
                    onPressed: () {},
                    child: const Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        "Cancel",
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
                        "Go to Meeting",
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
