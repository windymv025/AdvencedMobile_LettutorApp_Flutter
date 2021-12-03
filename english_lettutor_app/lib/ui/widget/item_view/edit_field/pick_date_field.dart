import 'package:english_lettutor_app/models/teacher/teacher.dart';
import 'package:english_lettutor_app/ui/widget/item_view/components/custom_suffix_icon.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class PickDateField extends StatefulWidget {
  const PickDateField(
      {Key? key,
      required this.controller,
      required this.icon,
      required this.label,
      required this.hint,
      this.initDate})
      : super(key: key);
  final TextEditingController controller;
  final DateTime? initDate;
  final IconData? icon;
  final String label;
  final String hint;

  @override
  _PickDateFieldState createState() => _PickDateFieldState();
}

class _PickDateFieldState extends State<PickDateField> {
  late Teacher teacher;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    teacher = Provider.of<Teacher>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        constraints: const BoxConstraints(maxWidth: 500),
        child: TextFormField(
          controller: widget.controller,
          readOnly: true,
          onTap: () => pickDate(context),
          decoration: InputDecoration(
            label: Text(widget.label),
            hintText: widget.hint,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            suffixIcon: widget.icon == null
                ? null
                : CustomSurffixIcon(icon: widget.icon!),
          ),
        ));
  }

  Future pickDate(BuildContext context) async {
    DateTime initialDate = DateTime.now();
    if (widget.initDate != null) {
      initialDate = widget.initDate!;
    }
    final newDate = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(1950),
      lastDate: initialDate,
    );

    if (newDate == null) return;
    setState(() {
      widget.controller.text = DateFormat("dd/MM/yyyy").format(newDate);
      teacher.birthday = newDate;
    });
  }
}
