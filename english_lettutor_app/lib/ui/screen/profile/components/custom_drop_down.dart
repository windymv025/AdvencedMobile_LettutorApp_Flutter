import 'package:english_lettutor_app/ui/widget/item_view/boder_input.dart';
import 'package:flutter/material.dart';

class CustomDropDown extends StatefulWidget {
  const CustomDropDown(
      {Key? key,
      required this.value,
      required this.title,
      required this.items,
      required this.icon,
      this.hint,
      this.onChanged})
      : super(key: key);
  final String title;
  final List<String> items;
  final String? value;
  final String? hint;
  final ValueChanged<String?>? onChanged;
  final IconData icon;

  @override
  _CustomDropDownState createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {
  @override
  Widget build(BuildContext context) {
    return BoderInput(
      icon: widget.icon,
      title: widget.title,
      child: DropdownButton<String>(
        value: widget.value,
        hint: Text(widget.hint ?? ""),
        underline: Container(),
        icon: const SizedBox.shrink(),
        onChanged: widget.onChanged,
        items: widget.items.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }
}
