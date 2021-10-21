import 'package:english_lettutor_app/models/teacher.dart';
import 'package:english_lettutor_app/utilities/constants/constants.dart';
import 'package:english_lettutor_app/utilities/constants/styles.dart';
import 'package:flutter/material.dart';

class ReportButton extends StatefulWidget {
  const ReportButton({Key? key, required this.teacher}) : super(key: key);
  final Teacher teacher;
  @override
  _ReportButtonState createState() => _ReportButtonState();
}

class _ReportButtonState extends State<ReportButton> {
  @override
  Widget build(BuildContext context) {
    return //Report
        IconButton(
            iconSize: 35,
            onPressed: () => showDialog<String>(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    title: Text(
                      'Report ${widget.teacher.name!}',
                      style: const TextStyle(
                          fontSize: textSizePageName,
                          fontWeight: FontWeight.bold),
                    ),
                    content: Container(
                      height: 300,
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
                                Text(
                                  "Help us understand what's happening",
                                  style: titleStyle,
                                ),
                              ],
                            ),
                          ),
                          CheckboxListTile(
                            value: false,
                            onChanged: (value) {},
                            title: const Text("This tutor is annoying me"),
                          ),
                          CheckboxListTile(
                            value: false,
                            onChanged: (value) {},
                            title: const Text(
                                "This profile is pretending be someone or is fake"),
                          ),
                          CheckboxListTile(
                            value: false,
                            onChanged: (value) {},
                            title: const Text("Inappropriate profile photo"),
                          ),
                          TextFormField(
                            maxLines: null,
                            minLines: 5,
                            textCapitalization: TextCapitalization.sentences,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(5))),
                          )
                        ],
                      ),
                    ),
                    actions: <Widget>[
                      OutlinedButton(
                        onPressed: () => Navigator.pop(context, 'Cancel'),
                        child: const Text('Cancel'),
                      ),
                      OutlinedButton(
                        onPressed: () => Navigator.pop(context, 'Submit'),
                        child: const Text('Submit'),
                      ),
                    ],
                  ),
                ),
            icon: const Icon(Icons.report_rounded, color: kMainBlueColor));
  }
}
