import 'package:english_lettutor_app/constants/constants.dart';
import 'package:english_lettutor_app/constants/design/styles.dart';
import 'package:english_lettutor_app/generated/l10n.dart';
import 'package:english_lettutor_app/models/teacher/teacher.dart';
import 'package:english_lettutor_app/ui/widget/item_view/edit_field/multiline_text_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CVTeacher extends StatefulWidget {
  const CVTeacher({Key? key}) : super(key: key);

  @override
  _CVTeacherState createState() => _CVTeacherState();
}

class _CVTeacherState extends State<CVTeacher> {
  final TextEditingController _interests = TextEditingController();
  final TextEditingController _education = TextEditingController();
  final TextEditingController _experience = TextEditingController();
  final TextEditingController _profession = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Teacher teacher = Provider.of<Teacher>(context);
    return Column(
      children: [
        //CV
        Row(
          children: const [Text("CV", style: titleBlueStyle), Spacer()],
        ),

        //Interests
        MultilineTextField(
          label: S.current.interests,
          hint:
              "Interests, hobbies, memorable life experiences, or anything else your'd like to share!",
          controller: _interests,
          onChanged: (value) => teacher.interests = value,
        ),

        //Education
        MultilineTextField(
            label: S.current.education,
            hint:
                "Interests, hobbies, memorable life experiences, or anything else your'd like to share!",
            controller: _education,
            onChanged: (value) => teacher.education = value),

        //Experience
        MultilineTextField(
            label: S.current.experience,
            hint: "Enter your Experience",
            controller: _experience,
            onChanged: (value) => teacher.experience = value),

        //Current or Previous Profession
        MultilineTextField(
            label: S.current.profession,
            hint: "Current or Previous Profession",
            controller: _profession,
            onChanged: (value) => teacher.profession = value),

        Padding(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: Divider(
            height: 3,
            color: kPrimaryColor.withOpacity(0.5),
          ),
        ),
      ],
    );
  }
}
