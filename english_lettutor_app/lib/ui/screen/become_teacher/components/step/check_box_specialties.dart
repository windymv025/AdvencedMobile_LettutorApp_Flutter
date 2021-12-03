import 'package:english_lettutor_app/constants/constants.dart';
import 'package:english_lettutor_app/constants/design/styles.dart';
import 'package:flutter/material.dart';

class CheckBoxSpecialties extends StatefulWidget {
  CheckBoxSpecialties({Key? key}) : super(key: key);

  final List<String> _checkBoxSelected = [];

  List<String> getCheckBoxSelected() {
    return _checkBoxSelected;
  }

  @override
  _CheckBoxSpecialtiesState createState() => _CheckBoxSpecialtiesState();
}

class _CheckBoxSpecialtiesState extends State<CheckBoxSpecialties> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: const [
            Text(
              "My specialties are",
              style: titleBlueStyle,
            ),
            Spacer()
          ],
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          children:
              kSpecialities.sublist(1).map((e) => _buildCheckBox(e)).toList(),
        )
      ],
    );
  }

  Widget _buildCheckBox(String text) {
    return ListTile(
      leading: Checkbox(
        value: widget._checkBoxSelected.contains(text),
        onChanged: (value) {
          setState(
            () {
              if (!value!) {
                widget._checkBoxSelected.remove(text);
              } else {
                widget._checkBoxSelected.add(text);
              }
            },
          );
        },
      ),
      title: Text(
        text,
        overflow: TextOverflow.clip,
      ),
    );
  }
}
