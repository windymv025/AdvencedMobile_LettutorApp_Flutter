import 'package:english_lettutor_app/models/profile.dart';
import 'package:english_lettutor_app/ui/screen/profile/components/custom_drop_down.dart';
import 'package:english_lettutor_app/ui/widget/item_view/button/default_button.dart';
import 'package:english_lettutor_app/ui/widget/item_view/components/custom_suffix_icon.dart';
import 'package:english_lettutor_app/ui/widget/item_view/edit_field/pick_country_field.dart';
import 'package:english_lettutor_app/ui/widget/item_view/edit_field/pick_date_field.dart';
import 'package:english_lettutor_app/utilities/constants/constants.dart';
import 'package:flutter/material.dart';

class ProfileForm extends StatefulWidget {
  const ProfileForm({Key? key}) : super(key: key);

  @override
  _ProfileFormState createState() => _ProfileFormState();
}

class _ProfileFormState extends State<ProfileForm> {
  Profile profile = Profile.getDefault();
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _country = TextEditingController();
  final TextEditingController _birthday = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
            width: 120,
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
