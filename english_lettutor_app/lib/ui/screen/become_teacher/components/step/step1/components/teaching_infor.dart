import 'package:english_lettutor_app/constants/constants.dart';
import 'package:english_lettutor_app/constants/design/styles.dart';
import 'package:english_lettutor_app/constants/enums.dart';
import 'package:english_lettutor_app/generated/l10n.dart';
import 'package:english_lettutor_app/models/teacher/teacher.dart';
import 'package:english_lettutor_app/ui/widget/item_view/edit_field/multi_item_select_field.dart';
import 'package:english_lettutor_app/ui/widget/item_view/edit_field/multiline_text_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TeachingInfor extends StatefulWidget {
  const TeachingInfor({Key? key}) : super(key: key);

  @override
  _TeachingInforState createState() => _TeachingInforState();
}

class _TeachingInforState extends State<TeachingInfor> {
  final TextEditingController _introduction = TextEditingController();
  MenuLevel? _level;
  @override
  Widget build(BuildContext context) {
    Teacher teacher = Provider.of<Teacher>(context);

    _introduction.text = teacher.description ?? '';
    return Column(
      children: [
        //Languages I speak
        Row(
          children: [
            Text(S.current.languages_speak, style: titleBlueStyle),
            const Spacer()
          ],
        ),
        //Languages
        const SizedBox(
          height: 10,
        ),

        MultiItemSelectField(
          items: kLanguages,
          icon: Icons.language_outlined,
          onConfirm: (values) {
            teacher.languages = values.cast<String>();
          },
          title: S.current.choose_language,
          buttonText: S.current.languages,
          onTap: (value) {
            setState(() {
              teacher.languages!.remove(value);
            });
          },
        ),

        Padding(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: Divider(
            height: 3,
            color: kPrimaryColor.withOpacity(0.5),
          ),
        ),
        //Who I teach
        Row(
          children: [
            Text(S.current.who_i_teach, style: titleBlueStyle),
            const Spacer()
          ],
        ),

        //Introduction
        MultilineTextField(
            label: S.current.introduction,
            hint:
                "Example: I was a doctor for 35 years and can help you practice business or medical English.",
            controller: _introduction,
            onChanged: (value) => teacher.description = value),

        //My specialties are
        const SizedBox(
          height: 15,
        ),
        Row(
          children: [
            Text(
              S.current.my_specialties_are,
              style: titleBlueStyle,
            ),
            const Spacer()
          ],
        ),
        const SizedBox(
          height: 15,
        ),
        MultiItemSelectField(
            items: kSpecialities.sublist(1),
            icon: Icons.bookmark_border_rounded,
            title: S.current.Choose_Specialities,
            buttonText: S.current.my_specialties_are,
            onConfirm: (values) {
              teacher.specialties = values.cast<String>();
            },
            onTap: (value) {
              setState(() {
                teacher.specialties!.remove(value);
              });
            }),

        //I am best at teaching students who are
        const SizedBox(
          height: 15,
        ),
        Row(
          children: [
            Expanded(
              child: Text(
                S.current.i_best_teaching_who,
                style: titleBlueStyle,
                overflow: TextOverflow.clip,
              ),
            ),
          ],
        ),

        //I am best at teaching students who are
        ListTile(
          title: const Text('Beginer'),
          leading: Radio<MenuLevel>(
            value: MenuLevel.beginer,
            groupValue: _level,
            onChanged: (MenuLevel? value) {
              setState(() {
                _level = value;
                teacher.level = 'Beginer';
              });
            },
          ),
        ),
        ListTile(
          title: const Text('Intermediate'),
          leading: Radio<MenuLevel>(
            value: MenuLevel.intermediate,
            groupValue: _level,
            onChanged: (MenuLevel? value) {
              setState(() {
                _level = value;
                teacher.level = 'Intermediate';
              });
            },
          ),
        ),
        ListTile(
          title: const Text('Advanced'),
          leading: Radio<MenuLevel>(
            value: MenuLevel.advanced,
            groupValue: _level,
            onChanged: (MenuLevel? value) {
              setState(() {
                _level = value;
                teacher.level = 'Advanced';
              });
            },
          ),
        ),

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
