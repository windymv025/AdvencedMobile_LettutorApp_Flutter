import 'package:english_lettutor_app/constants/constants.dart';
import 'package:english_lettutor_app/data/provider/profile_provider.dart';
import 'package:english_lettutor_app/generated/l10n.dart';
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
  List<String> _selectedPreparations = [];

  String? countryCode;

  @override
  void initState() {
    super.initState();
    ProfileProvider profileProvider =
        Provider.of<ProfileProvider>(context, listen: false);
    _selectedSpecialities.addAll(profileProvider.wantToLearn);
    _selectedPreparations.addAll(profileProvider.testPreparations);
    countryCode = profileProvider.backupProfile.country;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ProfileProvider>(builder: (context, profile, _) {
      if (profile.birthday != null) {
        _birthday.text = DateFormat("yyyy-MM-dd").format(profile.birthday!);
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
                    return S.current.please_enter_your_name;
                  }
                  if (value.length < 3) {
                    return S.current.err_name_short;
                  }
                  if (!RegExp(r'^[a-zA-Z ]+$').hasMatch(value)) {
                    return S.current.err_name_invalid;
                  }
                  return null;
                },
                decoration: InputDecoration(
                  label: Text(S.current.full_name),
                  hintText: S.current.please_enter_your_name,
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  suffixIcon: const CustomSurffixIcon(
                      icon: Icons.person_outline_rounded),
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
                    return S.current.err_null_phone;
                  }
                  if (value.length < 10 ||
                      !RegExp(r'^[0-9]+$').hasMatch(value)) {
                    return S.current.err_phone_invalid;
                  }
                  return null;
                },
                decoration: InputDecoration(
                  label: Text(S.current.phone_number),
                  hintText: S.current.enter_phone,
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  suffixIcon:
                      const CustomSurffixIcon(icon: Icons.phone_rounded),
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
              label: S.current.birthday,
              hint: S.current.select_your_birthday,
              onSaved: (newValue) => newValue != null
                  ? profile.birthday = DateFormat("yyyy-MM-dd").parse(newValue)
                  : null,
            ),
            //Country
            const SizedBox(
              height: 15,
            ),
            PickCountryField(
              controller: _country,
              onSaved: (newValue) => profile.country = countryCode,
              onCountryPressed: (country) => countryCode = country,
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
                  hint: S.current.choose_your_level,
                  value: kMapLevels[profile.backupProfile.level],
                  title: S.current.mylevel,
                  items: kMapLevels.keys.map((e) => kMapLevels[e]!).toList()),
            ),

            //Test practices
            const SizedBox(
              height: 10,
            ),

            MultiItemSelectField(
              items: kLearnTopics.map((e) => e.name).toList(),
              initialValue: profile.testPreparations,
              validator: (value) {
                if (value!.isEmpty || _selectedSpecialities.isEmpty) {
                  return S.current.err_choose_short;
                }

                return null;
              },
              onConfirm: (values) {
                setState(() {
                  _selectedPreparations = values.cast();
                });
              },
              onTap: (value) {
                setState(() {
                  if (_selectedPreparations.contains(value)) {
                    _selectedPreparations.remove(value);
                  }
                });
              },
              icon: Icons.book_rounded,
              buttonText: S.current.choose_test_practices,
              title: S.current.choose_test_practices,
            ),

            //learn topics
            const SizedBox(
              height: 10,
            ),

            MultiItemSelectField(
              items: kTestPractices.map((e) => e.name).toList(),
              initialValue: profile.wantToLearn,
              validator: (value) {
                if (value!.isEmpty || _selectedSpecialities.isEmpty) {
                  return S.current.err_choose_short;
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
              buttonText: S.current.choose_learn_topics,
              title: S.current.choose_learn_topics,
            ),

            //save
            const SizedBox(
              height: 20,
            ),
            Container(
              constraints: const BoxConstraints(maxWidth: 500),
              child: DefaultButton(
                text: S.current.save_changes,
                press: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    profile.wantToLearn = _selectedSpecialities;
                    profile.testPreparations = _selectedPreparations;
                    widget.onSubmit();
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(S.current.Profile_updated),
                    ));
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(S.current.err_fill_all),
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
