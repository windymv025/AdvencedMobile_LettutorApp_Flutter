import 'package:country_picker/country_picker.dart';
import 'package:english_lettutor_app/ui/widget/item_view/components/custom_suffix_icon.dart';
import 'package:flutter/material.dart';

class PickCountryField extends StatefulWidget {
  const PickCountryField({Key? key, required this.controller})
      : super(key: key);
  final TextEditingController controller;

  @override
  _PickCountryFieldState createState() => _PickCountryFieldState();
}

class _PickCountryFieldState extends State<PickCountryField> {
  @override
  Widget build(BuildContext context) {
    return Container(
        constraints: const BoxConstraints(maxWidth: 500),
        child: TextFormField(
          controller: widget.controller,
          readOnly: true,
          onTap: () => pickCountry(context),
          decoration: const InputDecoration(
            label: Text("Country"),
            hintText: "Select your Country",
            floatingLabelBehavior: FloatingLabelBehavior.always,
            suffixIcon: CustomSurffixIcon(icon: Icons.flag_rounded),
          ),
        ));
  }

  Future pickCountry(BuildContext context) async {
    showCountryPicker(
      context: context,
      onSelect: (Country country) {
        widget.controller.text = country.displayNameNoCountryCode;
      },
    );
  }
}