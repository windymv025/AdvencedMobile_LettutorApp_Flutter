import 'package:english_lettutor_app/constants/assets.dart';
import 'package:english_lettutor_app/constants/constants.dart';
import 'package:english_lettutor_app/constants/design/styles.dart';
import 'package:english_lettutor_app/constants/enums.dart';
import 'package:english_lettutor_app/ui/screen/become_teacher/components/step/check_box_specialties.dart';
import 'package:english_lettutor_app/ui/widget/item_view/components/custom_suffix_icon.dart';
import 'package:english_lettutor_app/ui/widget/item_view/edit_field/multiline_text_field.dart';
import 'package:english_lettutor_app/ui/widget/item_view/edit_field/pick_country_field.dart';
import 'package:english_lettutor_app/ui/widget/item_view/edit_field/pick_date_field.dart';
import 'package:flutter/material.dart';

class Step1Page extends StatefulWidget {
  const Step1Page({Key? key}) : super(key: key);

  @override
  _Step1PageState createState() => _Step1PageState();
}

class _Step1PageState extends State<Step1Page> {
  final TextEditingController _country = TextEditingController();
  final TextEditingController _birthday = TextEditingController();
  final TextEditingController _interests = TextEditingController();
  final TextEditingController _education = TextEditingController();
  final TextEditingController _experience = TextEditingController();
  final TextEditingController _profession = TextEditingController();
  MenuLevel? _level;
  final CheckBoxSpecialties _checkBoxSpecialties = CheckBoxSpecialties();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: const [
            Text(
              "Set up your tutor profile",
              style: pageNameStyle,
            ),
            Spacer()
          ],
        ),
        const Padding(
            padding: EdgeInsets.only(top: 10),
            child: Text(
              sep1Content,
              textAlign: TextAlign.justify,
              overflow: TextOverflow.clip,
              style: TextStyle(
                color: Colors.grey,
                fontStyle: FontStyle.italic,
              ),
            )),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: Divider(
            height: 3,
            color: kPrimaryColor.withOpacity(0.5),
          ),
        ),

        //Basic info
        Row(
          children: const [
            Text("Basic info", style: titleBlueStyle),
            Spacer(),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {},
              child: Container(
                margin: const EdgeInsets.all(10),
                width: 150,
                height: 150,
                child: Container(),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: const DecorationImage(
                      image: AssetImage(Assets.assetsImagesUserIcon)),
                  color: Colors.grey,
                ),
              ),
            ),
            const Expanded(
              child: SizedBox(
                width: 100,
                child: Text(
                  "Please upload your professional photo.\nSee guidelines",
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.clip,
                  softWrap: true,
                  style: TextStyle(color: kPrimaryColor),
                ),
              ),
            ),
          ],
        ),
        Container(
          constraints: const BoxConstraints(maxWidth: 500),
          child: TextFormField(
            keyboardType: TextInputType.name,
            onSaved: (newValue) {},
            onChanged: (value) {
              return;
            },
            decoration: const InputDecoration(
              label: Text("Full name"),
              hintText: "Enter your name",
              floatingLabelBehavior: FloatingLabelBehavior.always,
              suffixIcon: CustomSurffixIcon(icon: Icons.person_outline_rounded),
            ),
          ),
        ),
        //Birthday
        const SizedBox(
          height: 15,
        ),
        PickDateField(
          controller: _birthday,
          icon: Icons.date_range_outlined,
          label: "Birthday",
          hint: "Select your birthday",
        ),

        //Country
        const SizedBox(
          height: 15,
        ),
        PickCountryField(controller: _country),
        const SizedBox(
          height: 15,
        ),
        //CV
        Row(
          children: const [Text("CV", style: titleBlueStyle), Spacer()],
        ),

        //Interests
        MultilineTextField(
            label: "Interests",
            hint:
                "Interests, hobbies, memorable life experiences, or anything else your'd like to share!",
            controller: _interests),

        //Education
        MultilineTextField(
            label: "Education",
            hint:
                "Interests, hobbies, memorable life experiences, or anything else your'd like to share!",
            controller: _education),

        //Experience
        MultilineTextField(
            label: "Experience",
            hint: "Enter your Experience",
            controller: _experience),

        //Current or Previous Profession
        MultilineTextField(
            label: "Profession",
            hint: "Current or Previous Profession",
            controller: _profession),

        Padding(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: Divider(
            height: 3,
            color: kPrimaryColor.withOpacity(0.5),
          ),
        ),

        //Languages I speak
        Row(
          children: const [
            Text("Languages I speak", style: titleBlueStyle),
            Spacer()
          ],
        ),

        //Languages
        const SizedBox(
          height: 15,
        ),
        Container(
          constraints: const BoxConstraints(maxWidth: 500),
          child: TextFormField(
            keyboardType: TextInputType.name,
            onSaved: (newValue) {},
            onChanged: (value) {
              return;
            },
            decoration: const InputDecoration(
              label: Text("Languages"),
              hintText: "Example: English, Vietnamese, Chinese, Korean",
              floatingLabelBehavior: FloatingLabelBehavior.always,
              suffixIcon: CustomSurffixIcon(icon: Icons.person_outline_rounded),
            ),
          ),
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
          children: const [
            Text("Who I teach", style: titleBlueStyle),
            Spacer()
          ],
        ),

        //Introduction
        MultilineTextField(
            label: "Introduction",
            hint:
                "Example: I was a doctor for 35 years and can help you practice business or medical English.",
            controller: _experience),

        //I am best at teaching students who are
        const SizedBox(
          height: 15,
        ),
        Row(
          children: const [
            Expanded(
              child: Text(
                "I am best at teaching students who are",
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
              });
            },
          ),
        ),

        //My specialties are
        const SizedBox(
          height: 15,
        ),
        _checkBoxSpecialties,
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
