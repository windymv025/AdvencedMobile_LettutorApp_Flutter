import 'dart:io';

import 'package:english_lettutor_app/constants/constants.dart';
import 'package:english_lettutor_app/constants/design/styles.dart';
import 'package:english_lettutor_app/ui/widget/item_view/media/video_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class Step2Page extends StatefulWidget {
  const Step2Page({Key? key}) : super(key: key);

  @override
  _Step2PageState createState() => _Step2PageState();
}

class _Step2PageState extends State<Step2Page> {
  File? _videoFile;

  Future pickMedia(ImageSource imageSource) async {
    try {
      final file = await ImagePicker().pickVideo(source: imageSource);
      if (file == null) return;

      final imageTemp = File(file.path);
      setState(() {
        _videoFile = imageTemp;
      });
    } on PlatformException catch (e) {
      // ignore: avoid_print
      print('Failed to pick video: ${e.message}');
    }
  }

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

        _videoFile == null ? Container() : VideoWidget(_videoFile!),

        const SizedBox(height: 10),
        Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              OutlinedButton(
                child: const Text("Pick a video"),
                onPressed: () {
                  pickMedia(ImageSource.gallery);
                },
                style: outlineColorButtonStyle,
              ),
              const SizedBox(width: 10),
              OutlinedButton(
                child: const Text("Take a video"),
                onPressed: () {
                  pickMedia(ImageSource.camera);
                },
                style: outlineColorButtonStyle,
              ),
            ],
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
