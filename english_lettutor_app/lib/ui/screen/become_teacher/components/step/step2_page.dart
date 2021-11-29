import 'package:english_lettutor_app/constants/constants.dart';
import 'package:english_lettutor_app/constants/design/styles.dart';
import 'package:flutter/material.dart';

class Step2Page extends StatefulWidget {
  const Step2Page({Key? key}) : super(key: key);

  @override
  _Step2PageState createState() => _Step2PageState();
}

class _Step2PageState extends State<Step2Page> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: const [
            Text(
              "Introduce yourself",
              style: pageNameStyle,
            ),
            Spacer()
          ],
        ),
        const Padding(
            padding: EdgeInsets.only(top: 10),
            child: Text(
              step2Content,
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

        //Basic info
        Row(
          children: const [
            Text("Introduction video", style: titleBlueStyle),
            Spacer(),
          ],
        ),

        Row(
          children: [
            Expanded(
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                margin: const EdgeInsets.symmetric(vertical: 20),
                child: const Text(
                  videoTips,
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
                color: kMainBlueColor.withOpacity(0.2),
              ),
            ),
          ],
        ),

        Center(
          child: OutlinedButton(
            child: const Text("Choose video"),
            onPressed: () {},
            style: outlineColorButtonStyle,
          ),
        ),

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
