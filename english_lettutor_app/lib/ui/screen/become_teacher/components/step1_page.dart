import 'package:english_lettutor_app/ui/screen/profile/components/custom_drop_down.dart';
import 'package:english_lettutor_app/ui/widget/item_list/my_list_tile.dart';
import 'package:english_lettutor_app/ui/widget/item_view/boder_input.dart';
import 'package:english_lettutor_app/ui/widget/item_view/custom_suffix_icon.dart';
import 'package:english_lettutor_app/utilities/constants/assets.dart';
import 'package:english_lettutor_app/utilities/constants/constants.dart';
import 'package:english_lettutor_app/utilities/constants/styles.dart';
import 'package:flutter/material.dart';

class Step1Page extends StatefulWidget {
  Step1Page({Key? key}) : super(key: key);

  @override
  _Step1PageState createState() => _Step1PageState();
}

class _Step1PageState extends State<Step1Page> {
  static String sep1Content =
      """Your tutor profile is your chance to market yourself to students on Tutoring. You can make edits later on your profile settings page.

New students may browse tutor profiles to find a tutor that fits their learning goals and personality. Returning students may use the tutor profiles to find tutors they've had great experiences with already.""";
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MyListTile(
            avatar: const AssetImage(Assets.assetsImagesStep1),
            title: const Text(
              "Set up your tutor profile",
              style: pageNameStyle,
            ),
            subtitle: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text(sep1Content, textAlign: TextAlign.justify),
            ),
            trailing: const SizedBox.square(),
            onTap: null,
            color: Colors.white),

        //Basic info
        const Text("Basic info", style: titleBlueStyle),
        Center(
          child: Container(
            margin: const EdgeInsets.all(10),
            width: 150,
            height: 150,
            color: Colors.grey.shade400,
            child: const Center(
                child: Text(
              "Please upload your professional photo. See guidelines",
              textAlign: TextAlign.center,
            )),
          ),
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
        GestureDetector(
          onTap: () {
            showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(1950),
                lastDate: DateTime(DateTime.now().year));
          },
          child: Container(
              constraints: const BoxConstraints(maxWidth: 500),
              child: const BoderInput(
                  icon: Icons.date_range_outlined,
                  title: "Birthday",
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    child: Text("Pick your birthday"),
                  ))),
        ),
        //Country
        const SizedBox(
          height: 10,
        ),
        Container(
          constraints: const BoxConstraints(maxWidth: 500),
          child: CustomDropDown(
              icon: Icons.flag_rounded,
              onChanged: (newValue) => {setState(() {})},
              value: null,
              title: "Country",
              hint: "Choose your country",
              items: kCountries),
        ),
        const SizedBox(
          height: 20,
        ),
        //CV
        const Text("CV", style: titleBlueStyle),

        //Interests
        const SizedBox(
          height: 10,
        ),
        Container(
          constraints: const BoxConstraints(maxWidth: 500),
          child: TextFormField(
            keyboardType: TextInputType.multiline,
            onSaved: (newValue) {},
            onChanged: (value) {
              return;
            },
            maxLines: null,
            decoration: const InputDecoration(
              label: Text("Interests"),
              hintText:
                  "Interests, hobbies, memorable life experiences, or anything else your'd like to share!",
              floatingLabelBehavior: FloatingLabelBehavior.always,
              suffixIcon: CustomSurffixIcon(icon: Icons.person_outline_rounded),
            ),
          ),
        ),

        //Education
        const SizedBox(
          height: 10,
        ),
        Container(
          constraints: const BoxConstraints(maxWidth: 500),
          child: TextFormField(
            keyboardType: TextInputType.multiline,
            onSaved: (newValue) {},
            onChanged: (value) {
              return;
            },
            maxLines: null,
            decoration: const InputDecoration(
              label: Text("Education"),
              hintText:
                  "Example: Bachelor of Art in English from Cambly University",
              floatingLabelBehavior: FloatingLabelBehavior.always,
              suffixIcon: CustomSurffixIcon(icon: Icons.person_outline_rounded),
            ),
          ),
        ),

        //Experience
        const SizedBox(
          height: 10,
        ),
        Container(
          constraints: const BoxConstraints(maxWidth: 500),
          child: TextFormField(
            keyboardType: TextInputType.multiline,
            onSaved: (newValue) {},
            onChanged: (value) {
              return;
            },
            maxLines: null,
            decoration: const InputDecoration(
              label: Text("Experience"),
              hintText: "Enter your Experience",
              floatingLabelBehavior: FloatingLabelBehavior.always,
              suffixIcon: CustomSurffixIcon(icon: Icons.person_outline_rounded),
            ),
          ),
        ),

        //Current or Previous Profession
        const SizedBox(
          height: 10,
        ),
        Container(
          constraints: const BoxConstraints(maxWidth: 500),
          child: TextFormField(
            keyboardType: TextInputType.multiline,
            onSaved: (newValue) {},
            onChanged: (value) {
              return;
            },
            maxLines: null,
            decoration: const InputDecoration(
              label: Text("Current or Previous Profession"),
              hintText: "Enter your Current or Previous Profession",
              floatingLabelBehavior: FloatingLabelBehavior.always,
              suffixIcon: CustomSurffixIcon(icon: Icons.person_outline_rounded),
            ),
          ),
        ),
      ],
    );
  }
}
