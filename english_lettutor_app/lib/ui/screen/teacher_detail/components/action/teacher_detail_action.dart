import 'package:english_lettutor_app/constants/constants.dart';
import 'package:english_lettutor_app/data/provider/teacher_dto.dart';
import 'package:english_lettutor_app/generated/l10n.dart';
import 'package:english_lettutor_app/models/teacher/teacher.dart';
import 'package:english_lettutor_app/ui/widget/item_view/button/default_button.dart';
import 'package:english_lettutor_app/ui/widget/item_view/sheet/bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TeacherDetailAction extends StatefulWidget {
  const TeacherDetailAction({Key? key, required this.teacher})
      : super(key: key);
  final Teacher teacher;

  @override
  _TeacherDetailActionState createState() => _TeacherDetailActionState();
}

class _TeacherDetailActionState extends State<TeacherDetailAction> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    final TeacherDTO provider = context.watch<TeacherDTO>();

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: isLoading
              ? Center(
                  child: CircularProgressIndicator(
                    valueColor: const AlwaysStoppedAnimation(kMainBlueColor),
                    backgroundColor: Colors.grey[200],
                  ),
                )
              : DefaultButton(
                  text: S.current.booking,
                  press: () {
                    showDateTimeBottomSheet(
                        context, provider.getFreeDate(widget.teacher.id));
                  },
                ),
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
