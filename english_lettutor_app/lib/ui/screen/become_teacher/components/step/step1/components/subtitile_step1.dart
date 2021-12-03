import 'package:english_lettutor_app/constants/constants.dart';
import 'package:english_lettutor_app/constants/design/styles.dart';
import 'package:flutter/material.dart';

class SubtitleStep1 extends StatelessWidget {
  const SubtitleStep1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: const [
            Text(
              "Set up your tutor profile",
              style: pageNameStyle,
            ),
            Spacer()
          ],
        ),
        const Padding(
            padding: EdgeInsets.only(top: 10),
            child: Text(
              sep1Content,
              textAlign: TextAlign.justify,
              overflow: TextOverflow.clip,
              style: TextStyle(
                color: Colors.grey,
                fontStyle: FontStyle.italic,
              ),
            )),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: Divider(
            height: 3,
            color: kPrimaryColor.withOpacity(0.5),
          ),
        ),
      ],
    );
  }
}
