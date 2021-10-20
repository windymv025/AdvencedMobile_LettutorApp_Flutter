import 'package:english_lettutor_app/models/profile.dart';
import 'package:english_lettutor_app/ui/screen/profile/components/custom_drop_down.dart';
import 'package:english_lettutor_app/ui/widget/item_view/boder_input.dart';
import 'package:english_lettutor_app/ui/widget/item_view/button/default_button.dart';
import 'package:english_lettutor_app/ui/widget/item_view/custom_suffix_icon.dart';
import 'package:english_lettutor_app/utilities/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ProfileForm extends StatefulWidget {
  const ProfileForm({Key? key}) : super(key: key);

  @override
  _ProfileFormState createState() => _ProfileFormState();
}

class _ProfileFormState extends State<ProfileForm> {
  Profile profile = Profile.getDefault();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    DateFormat dateFormat = DateFormat("dd-MM-yyyy");
    return Form(
      key: _formKey,
      child: Column(
        children: [
          // fullname
          Container(
            constraints: const BoxConstraints(maxWidth: 500),
            child: TextFormField(
              initialValue: profile.fullName,
              keyboardType: TextInputType.name,
              onSaved: (newValue) => profile.fullName = newValue,
              onChanged: (value) {
                return;
              },
              decoration: const InputDecoration(
                label: Text("Full name"),
                hintText: "Enter your name",
                floatingLabelBehavior: FloatingLabelBehavior.always,
                suffixIcon:
                    CustomSurffixIcon(icon: Icons.person_outline_rounded),
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          //Email
          Container(
            constraints: const BoxConstraints(maxWidth: 500),
            child: TextFormField(
              readOnly: true,
              enabled: false,
              initialValue: profile.email,
              keyboardType: TextInputType.emailAddress,
              onSaved: (newValue) => profile.email = newValue,
              onChanged: (value) {},
              validator: (value) {
                return null;
              },
              decoration: const InputDecoration(
                label: Text("Email"),
                hintText: "Enter your email",
                floatingLabelBehavior: FloatingLabelBehavior.always,
                suffixIcon: CustomSurffixIcon(icon: Icons.mail_outline_rounded),
              ),
            ),
          ),
          // phone number
          const SizedBox(
            height: 15,
          ),
          Container(
            constraints: const BoxConstraints(maxWidth: 500),
            child: TextFormField(
              initialValue: profile.phone,
              keyboardType: TextInputType.phone,
              onSaved: (newValue) => profile.phone = newValue,
              onChanged: (value) {},
              validator: (value) {
                return null;
              },
              decoration: const InputDecoration(
                label: Text("Phone number"),
                hintText: "Enter your phone number",
                floatingLabelBehavior: FloatingLabelBehavior.always,
                suffixIcon: CustomSurffixIcon(icon: Icons.phone_rounded),
              ),
            ),
          ),
          //Birthday
          const SizedBox(
            height: 15,
          ),
          GestureDetector(
            onTap: () async {
              DateTime? pickDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(1950),
                  lastDate: DateTime(DateTime.now().year));
              setState(() {
                if (pickDate != null && pickDate != profile.birthDay) {
                  profile.birthDay = pickDate;
                }
              });
            },
            child: Container(
                constraints: const BoxConstraints(maxWidth: 500),
                child: BoderInput(
                    icon: Icons.date_range_outlined,
                    title: "Birthday",
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: Text(profile.birthDay == null
                          ? "Pick your birthday"
                          : dateFormat.format(profile.birthDay!)),
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
                onChanged: (newValue) => {
                      setState(() {
                        profile.country = newValue;
                      })
                    },
                value: profile.country,
                title: "Country",
                hint: "Choose your country",
                items: kCountries),
          ),
          //My level
          const SizedBox(
            height: 10,
          ),
          Container(
            constraints: const BoxConstraints(maxWidth: 500),
            child: CustomDropDown(
                icon: Icons.format_list_numbered_rounded,
                onChanged: (newValue) {
                  setState(() {
                    profile.level = newValue;
                  });
                },
                hint: "Choose your level",
                value: profile.level,
                title: "My level",
                items: kLevels),
          ),

          //Want to learn
          const SizedBox(
            height: 10,
          ),

          Container(
            constraints: const BoxConstraints(maxWidth: 500),
            child: const CustomDropDown(
                icon: Icons.list_alt_rounded,
                hint: "What do you want to learn",
                value: null,
                title: "Want to learn",
                items: kCountries),
          ),

          //save
          const SizedBox(
            height: 20,
          ),
          Container(
            constraints: const BoxConstraints(maxWidth: 500),
            child: DefaultButton(
              text: "Save changes",
              press: () {},
            ),
          ),

          //
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
