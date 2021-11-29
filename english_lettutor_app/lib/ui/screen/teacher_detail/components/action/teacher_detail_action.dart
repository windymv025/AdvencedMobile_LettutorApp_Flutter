import 'package:english_lettutor_app/constants/constants.dart';
import 'package:english_lettutor_app/models/teacher/teacher.dart';
import 'package:english_lettutor_app/ui/screen/messenger_detail/messenger_detail_screen.dart';
import 'package:english_lettutor_app/ui/screen/teacher_detail/components/action/dialog/report_button.dart';
import 'package:english_lettutor_app/ui/widget/item_view/button/default_button.dart';
import 'package:english_lettutor_app/ui/widget/item_view/components/bottom_sheet.dart';
import 'package:flutter/material.dart';

class TeacherDetailAction extends StatelessWidget {
  const TeacherDetailAction({Key? key, required this.teacher})
      : super(key: key);
  final Teacher teacher;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: DefaultButton(
            text: "Booking",
            press: () {
              showDateTimeBottomSheet(context, teacher.freeDate);
            },
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //Messager
            IconButton(
                iconSize: 35,
                onPressed: () {
                  Navigator.pushNamed(context, MessengerDetailScreen.routeName);
                },
                icon: const Icon(
                  Icons.message_rounded,
                  color: kMainBlueColor,
                )),
            const SizedBox(
              width: 50,
            ),
            //Report
            ReportButton(teacher: teacher),
          ],
        ),
      ],
    );
  }
}
