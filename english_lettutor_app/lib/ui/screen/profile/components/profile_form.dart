import 'package:english_lettutor_app/constants/constants.dart';
import 'package:english_lettutor_app/models/profile/profile.dart';
import 'package:english_lettutor_app/ui/screen/profile/components/custom_drop_down.dart';
import 'package:english_lettutor_app/ui/widget/item_view/button/default_button.dart';
import 'package:english_lettutor_app/ui/widget/item_view/components/custom_suffix_icon.dart';
import 'package:english_lettutor_app/ui/widget/item_view/edit_field/multi_item_select_field.dart';
import 'package:english_lettutor_app/ui/widget/item_view/edit_field/pick_country_field.dart';
import 'package:english_lettutor_app/ui/widget/item_view/edit_field/pick_date_field.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class ProfileForm extends StatefulWidget {
  const ProfileForm({Key? key}) : super(key: key);

  @override
  _ProfileFormState createState() => _ProfileFormState();
}

class _ProfileFormState extends State<ProfileForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _country = TextEditingController();
  final TextEditingController _birthday = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<Profile>(builder: (context, profile, _) {
      if (profile.birthday != null) {
        _birthday.text = DateFormat("dd/MM/yyyy").format(profile.birthday!);
      }
      if (profile.country != null) {
        _country.text = profile.country!;
      }
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
                onSaved: (newValue) => profile.fullName = newValue!,
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
              initDate: profile.birthday,
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

            MultiItemSelectField(
              items: kSpecialities.sublist(1),
              onConfirm: (values) {},
              onTap: (value) {},
              icon: Icons.format_list_numbered_rounded,
              buttonText: "What do you want to learn",
              title: "Choose Specialities",
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
    });
  }
}
