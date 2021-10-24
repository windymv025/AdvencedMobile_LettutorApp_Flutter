import 'package:english_lettutor_app/models/teacher.dart';
import 'package:english_lettutor_app/ui/widget/item_view/components/custom_suffix_icon.dart';
import 'package:english_lettutor_app/utilities/constants/constants.dart';
import 'package:english_lettutor_app/utilities/design/styles.dart';
import 'package:flutter/material.dart';

class ReportButton extends StatefulWidget {
  const ReportButton({Key? key, required this.teacher}) : super(key: key);
  final Teacher teacher;
  @override
  _ReportButtonState createState() => _ReportButtonState();
}

class _ReportButtonState extends State<ReportButton> {
  final List<String> _checkBoxSelected = [];

  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    for (var item in _checkBoxSelected) {
      _controller.text += item;
    }
    return //Report
        IconButton(
            iconSize: 35,
            onPressed: () => showDialog<String>(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    title: Text(
                      'Report ${widget.teacher.name!}',
                      overflow: TextOverflow.clip,
                      softWrap: true,
                      style: const TextStyle(
                          fontSize: textSizePageName,
                          fontWeight: FontWeight.bold),
                    ),
                    content: SingleChildScrollView(
                      child: Container(
                        decoration: const BoxDecoration(
                            border: Border.symmetric(
                                horizontal: BorderSide(width: 0.5))),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: const [
                                  Icon(
                                    Icons.info_rounded,
                                    color: kMainBlueColor,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                    child: Text(
                                      "Help us understand what's happening",
                                      overflow: TextOverflow.clip,
                                      softWrap: true,
                                      style: titleStyle,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            ListTile(
                              title: const Text('This tutor is annoying me'),
                              leading: Checkbox(
                                value: _checkBoxSelected
                                    .contains("This tutor is annoying me"),
                                onChanged: (value) {
                                  setState(() {
                                    if (!value!) {
                                      _checkBoxSelected
                                          .remove("This tutor is annoying me");
                                    } else {
                                      _checkBoxSelected
                                          .add("This tutor is annoying me");
                                    }
                                  });
                                },
                              ),
                            ),
                            ListTile(
                              title: const Text(
                                  'This profile is pretending be someone or is fake'),
                              leading: Checkbox(
                                value: _checkBoxSelected.contains(
                                    "This profile is pretending be someone or is fake"),
                                onChanged: (value) {
                                  setState(() {
                                    if (!value!) {
                                      _checkBoxSelected.remove(
                                          "This profile is pretending be someone or is fake");
                                    } else {
                                      _checkBoxSelected.add(
                                          "This profile is pretending be someone or is fake");
                                    }
                                  });
                                },
                              ),
                            ),
                            ListTile(
                              title: const Text('Inappropriate profile photo'),
                              leading: Checkbox(
                                value: _checkBoxSelected
                                    .contains("Inappropriate profile photo"),
                                onChanged: (value) {
                                  setState(() {
                                    if (!value!) {
                                      _checkBoxSelected.remove(
                                          "Inappropriate profile photo");
                                    } else {
                                      _checkBoxSelected
                                          .add("Inappropriate profile photo");
                                    }
                                  });
                                },
                              ),
                            ),
                            TextFormField(
                              controller: _controller,
                              keyboardType: TextInputType.multiline,
                              autofocus: true,
                              maxLines: null,
                              textCapitalization: TextCapitalization.sentences,
                              decoration: const InputDecoration(
                                label: Text("Report content"),
                                hintText: "Enter report content",
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.always,
                                suffixIcon: CustomSurffixIcon(
                                    icon: Icons.report_gmailerrorred_rounded),
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            )
                          ],
                        ),
                      ),
                    ),
                    actions: <Widget>[
                      OutlinedButton(
                        onPressed: () => Navigator.pop(context, 'Cancel'),
                        child: const Text('Cancel'),
                        style: outlineButtonStyle,
                      ),
                      OutlinedButton(
                        onPressed: () => Navigator.pop(context, 'Submit'),
                        child: const Text('Submit'),
                        style: outlineButtonStyle,
                      ),
                    ],
                  ),
                ),
            icon: const Icon(Icons.report_rounded, color: kMainBlueColor));
  }
}
