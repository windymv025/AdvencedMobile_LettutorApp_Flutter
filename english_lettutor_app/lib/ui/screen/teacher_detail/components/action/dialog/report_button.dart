import 'package:english_lettutor_app/constants/constants.dart';
import 'package:english_lettutor_app/constants/design/styles.dart';
import 'package:english_lettutor_app/models/teacher/teacher.dart';
import 'package:english_lettutor_app/ui/widget/item_view/components/custom_suffix_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class ReportButton extends StatefulWidget {
  const ReportButton({Key? key, required this.teacher}) : super(key: key);
  final Teacher teacher;
  @override
  _ReportButtonState createState() => _ReportButtonState();
}

class _ReportButtonState extends State<ReportButton> {
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return //Report
        IconButton(
            iconSize: 35,
            onPressed: () => showDialog<String>(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    contentPadding: const EdgeInsets.all(8),
                    alignment: Alignment.center,
                    title: Text(
                      'Report "${widget.teacher.name!}"',
                      overflow: TextOverflow.clip,
                      softWrap: true,
                      style: const TextStyle(
                          fontSize: textSizePageName,
                          fontWeight: FontWeight.bold),
                    ),
                    content: Container(
                      decoration: const BoxDecoration(
                          border: Border.symmetric(
                              horizontal: BorderSide(width: 0.5))),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const SizedBox(height: 10),
                          Row(
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
                          const SizedBox(
                            height: 15,
                          ),
                          TextFormField(
                            controller: _controller,
                            keyboardType: TextInputType.multiline,
                            autofocus: true,
                            maxLines: 4,
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
                          const SizedBox(height: 10),
                        ],
                      ),
                    ),
                    actions: <Widget>[
                      OutlinedButton(
                        onPressed: () => Navigator.pop(context, 'Cancel'),
                        child: const Text('Cancel'),
                        style: outlineButtonStyle,
                      ),
                      ElevatedButton(
                        onPressed: () => Navigator.pop(context, 'Submit'),
                        child: const Text('Submit', style: chipStyleOn),
                        style: defaultButtonStyle,
                      ),
                    ],
                  ),
                ),
            icon: const Icon(Icons.report_rounded, color: kMainBlueColor));
  }
}
