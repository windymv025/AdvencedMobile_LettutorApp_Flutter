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
        ListTile(
          title: const Text('English for kids'),
          leading: Checkbox(
            value: widget._checkBoxSelected.contains("English for kids"),
            onChanged: (value) {
              setState(() {
                if (!value!) {
                  widget._checkBoxSelected.remove("English for kids");
                } else {
                  widget._checkBoxSelected.add("English for kids");
                }
              });
            },
          ),
        ),
        ListTile(
          leading: Checkbox(
              value: widget._checkBoxSelected.contains("English for Business"),
              onChanged: (value) {
                setState(
                  () {
                    if (!value!) {
                      widget._checkBoxSelected.remove("English for Business");
                    } else {
                      widget._checkBoxSelected.add("English for Business");
                    }
                  },
                );
              }),
          title: const Text("English for Business"),
        ),
        ListTile(
          leading: Checkbox(
            value: widget._checkBoxSelected.contains("Conversational"),
            onChanged: (value) {
              setState(
                () {
                  if (!value!) {
                    widget._checkBoxSelected.remove("Conversational");
                  } else {
                    widget._checkBoxSelected.add("Conversational");
                  }
                },
              );
            },
          ),
          title: const Text("Conversational"),
        ),
        ListTile(
          leading: Checkbox(
            value: widget._checkBoxSelected.contains("STARTERS"),
            onChanged: (value) {
              setState(
                () {
                  if (!value!) {
                    widget._checkBoxSelected.remove("STARTERS");
                  } else {
                    widget._checkBoxSelected.add("STARTERS");
                  }
                },
              );
            },
          ),
          title: const Text("STARTERS"),
        ),
        ListTile(
          leading: Checkbox(
            value: widget._checkBoxSelected.contains("MOVERS"),
            onChanged: (value) {
              setState(
                () {
                  if (!value!) {
                    widget._checkBoxSelected.remove("MOVERS");
                  } else {
                    widget._checkBoxSelected.add("MOVERS");
                  }
                },
              );
            },
          ),
          title: const Text("MOVERS"),
        ),
        ListTile(
          leading: Checkbox(
            value: widget._checkBoxSelected.contains("FLYERS"),
            onChanged: (value) {
              setState(
                () {
                  if (!value!) {
                    widget._checkBoxSelected.remove("FLYERS");
                  } else {
                    widget._checkBoxSelected.add("FLYERS");
                  }
                },
              );
            },
          ),
          title: const Text("FLYERS"),
        ),
        ListTile(
          leading: Checkbox(
            value: widget._checkBoxSelected.contains("KET"),
            onChanged: (value) {
              setState(
                () {
                  if (!value!) {
                    widget._checkBoxSelected.remove("KET");
                  } else {
                    widget._checkBoxSelected.add("KET");
                  }
                },
              );
            },
          ),
          title: const Text("KET"),
        ),
        ListTile(
          leading: Checkbox(
            value: widget._checkBoxSelected.contains("PET"),
            onChanged: (value) {
              setState(
                () {
                  if (!value!) {
                    widget._checkBoxSelected.remove("PET");
                  } else {
                    widget._checkBoxSelected.add("PET");
                  }
                },
              );
            },
          ),
          title: const Text("PET"),
        ),
        ListTile(
          leading: Checkbox(
            value: widget._checkBoxSelected.contains("IELTS"),
            onChanged: (value) {
              setState(
                () {
                  if (!value!) {
                    widget._checkBoxSelected.remove("IELTS");
                  } else {
                    widget._checkBoxSelected.add("IELTS");
                  }
                },
              );
            },
          ),
          title: const Text("IELTS"),
        ),
        ListTile(
          leading: Checkbox(
            value: widget._checkBoxSelected.contains("TOEFL"),
            onChanged: (value) {
              setState(
                () {
                  if (!value!) {
                    widget._checkBoxSelected.remove("TOEFL");
                  } else {
                    widget._checkBoxSelected.add("TOEFL");
                  }
                },
              );
            },
          ),
          title: const Text("TOEFL"),
        ),
        ListTile(
          leading: Checkbox(
            value: widget._checkBoxSelected.contains("TOEIC"),
            onChanged: (value) {
              setState(
                () {
                  if (!value!) {
                    widget._checkBoxSelected.remove("TOEIC");
                  } else {
                    widget._checkBoxSelected.add("TOEIC");
                  }
                },
              );
            },
          ),
          title: const Text("TOEIC"),
        ),
      ],
    );
  }
}
