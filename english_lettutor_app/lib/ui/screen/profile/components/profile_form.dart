import 'package:english_lettutor_app/constants/constants.dart';
import 'package:english_lettutor_app/data/provider/profile_provider.dart';
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
  const ProfileForm({Key? key, required this.onSubmit}) : super(key: key);
  final Function onSubmit;

  @override
  _ProfileFormState createState() => _ProfileFormState();
}

class _ProfileFormState extends State<ProfileForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _country = TextEditingController();
  final TextEditingController _birthday = TextEditingController();
  List<String> _selectedSpecialities = [];

  @override
  Widget build(BuildContext context) {
    return Consumer<ProfileProvider>(builder: (context, profile, _) {
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
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your full name';
                  }
                  if (value.length < 3) {
                    return 'Your full name must be at least 3 characters long';
                  }
                  if (value.length > 50) {
                    return 'Your full name must be less than 50 characters long';
                  }
                  if (!RegExp(r'^[a-zA-Z ]+$').hasMatch(value)) {
                    return 'Your full name must contain only letters';
                  }
                  return null;
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
                  if (value!.isEmpty) {
                    return "Phone number is required";
                  }
                  if (value.length < 10) {
                    return "Phone number must be at least 10 characters";
                  }
                  if (value.length > 15) {
                    return "Phone number must be less than 15 characters";
                  }
                  if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                    return "Phone number must contain only numbers";
                  }
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
              onSaved: (newValue) => newValue != null
                  ? profile.birthday = DateFormat("dd/MM/yyyy").parse(newValue)
                  : null,
            ),
            //Country
            const SizedBox(
              height: 15,
            ),
            PickCountryField(
              controller: _country,
              onSaved: (newValue) => profile.country = newValue,
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
                  value: profile.backupProfile.level,
                  title: "My level",
                  items: kLevels),
            ),

            //Want to learn
            const SizedBox(
              height: 10,
            ),

            MultiItemSelectField(
              items: kSpecialities.sublist(1),
              initialValue: profile.wantToLearn,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please select at least one item';
                }
                if (_selectedSpecialities.isEmpty) {
                  return 'Please select at least one item';
                }
                return null;
              },
              onConfirm: (values) {
                setState(() {
                  _selectedSpecialities = values.cast();
                });
              },
              onTap: (value) {
                setState(() {
                  if (_selectedSpecialities.contains(value)) {
                    _selectedSpecialities.remove(value);
                  }
                });
              },
              icon: Icons.book_rounded,
              buttonText: "What do you want to learn?",
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
                press: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    profile.backupProfile.wantToLearn.clear();
                    profile.wantToLearn.addAll(_selectedSpecialities);
                    widget.onSubmit();
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text("Profile updated"),
                    ));
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text("Please fill all fields"),
                    ));
                  }
                },
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
