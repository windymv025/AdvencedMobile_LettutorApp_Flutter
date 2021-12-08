import 'package:country_picker/country_picker.dart';
import 'package:english_lettutor_app/generated/l10n.dart';
import 'package:english_lettutor_app/ui/widget/item_view/components/custom_suffix_icon.dart';
import 'package:flutter/material.dart';

class PickCountryField extends StatefulWidget {
  const PickCountryField(
      {Key? key,
      this.controller,
      this.initialValue,
      this.onChanged,
      this.onSaved})
      : super(key: key);
  final TextEditingController? controller;
  final String? initialValue;
  final ValueChanged<String>? onChanged;
  final FormFieldSetter<String>? onSaved;

  @override
  _PickCountryFieldState createState() => _PickCountryFieldState();
}

class _PickCountryFieldState extends State<PickCountryField> {
  String? _value;
  @override
  Widget build(BuildContext context) {
    _value = widget.initialValue;
    return Container(
        constraints: const BoxConstraints(maxWidth: 500),
        child: TextFormField(
          controller: widget.controller,
          initialValue: _value,
          readOnly: true,
          onChanged: widget.onChanged,
          onTap: () => pickCountry(context),
          validator: (value) =>
              value!.isEmpty ? S.current.please_select_country : null,
          onSaved: widget.onSaved,
          decoration: InputDecoration(
            label: Text(S.current.country),
            hintText: S.current.Select_your_country,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            suffixIcon: const CustomSurffixIcon(icon: Icons.flag_rounded),
          ),
        ));
  }

  Future pickCountry(BuildContext context) async {
    showCountryPicker(
      context: context,
      onSelect: (Country country) {
        String _country = country.name;
        widget.controller?.text = _country;
        _value = _country;
      },
    );
  }
}
