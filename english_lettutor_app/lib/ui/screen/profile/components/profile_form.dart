import 'package:english_lettutor_app/ui/widget/item_view/custom_suffix_icon.dart';
import 'package:flutter/material.dart';

class ProfileForm extends StatefulWidget {
  ProfileForm({Key? key}) : super(key: key);

  @override
  _ProfileFormState createState() => _ProfileFormState();
}

class _ProfileFormState extends State<ProfileForm> {
  String? fullName;
  String? email;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          keyboardType: TextInputType.name,
          onSaved: (newValue) => fullName = newValue,
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
        TextFormField(
          keyboardType: TextInputType.emailAddress,
          onSaved: (newValue) => email = newValue,
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
        TextFormField(
          keyboardType: TextInputType.phone,
          onSaved: (newValue) => email = newValue,
          onChanged: (value) {},
          validator: (value) {
            return null;
          },
          decoration: const InputDecoration(
            label: Text("Phone number"),
            hintText: "Enter your phone number",
            floatingLabelBehavior: FloatingLabelBehavior.always,
            suffixIcon: CustomSurffixIcon(icon: Icons.mail_outline_rounded),
          ),
        )
      ],
    );
  }
}
