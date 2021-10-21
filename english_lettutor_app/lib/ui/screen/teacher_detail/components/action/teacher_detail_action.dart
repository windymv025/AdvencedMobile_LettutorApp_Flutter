import 'package:english_lettutor_app/models/teacher.dart';
import 'package:english_lettutor_app/ui/screen/teacher_detail/components/action/dialog/report_button.dart';
import 'package:english_lettutor_app/ui/widget/item_view/button/default_button.dart';
import 'package:english_lettutor_app/utilities/constants/constants.dart';
import 'package:english_lettutor_app/utilities/constants/styles.dart';
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
            press: () {},
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
                iconSize: 35,
                onPressed: () {},
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

  showDialogReport(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text(
                "Report ${teacher.name}",
                style: titleStyle,
              ),
            ));
  }
}
