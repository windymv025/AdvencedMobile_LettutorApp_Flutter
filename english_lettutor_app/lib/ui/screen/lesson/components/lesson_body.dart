import 'package:english_lettutor_app/utilities/constants/assets.dart';
import 'package:english_lettutor_app/utilities/constants/constants.dart';
import 'package:flutter/material.dart';

class LessonBody extends StatefulWidget {
  const LessonBody({Key? key}) : super(key: key);

  @override
  _LessonBodyState createState() => _LessonBodyState();
}

class _LessonBodyState extends State<LessonBody> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      color: Colors.black,
      child: Center(
        child: Stack(
          children: [
            Center(
              child: CircleAvatar(
                backgroundImage:
                    const AssetImage(Assets.assetsImagesNoDataFound),
                radius: size.width * 0.25,
              ),
            ),
            Center(
              child: Container(
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "20:00:00 until lesson start (Sat, 23 Oct 21 22:00)",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white, fontSize: textSizeTitle),
                      overflow: TextOverflow.clip,
                    ),
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(36),
                      color: Colors.black.withOpacity(0.3))),
            ),
          ],
        ),
      ),
    );
  }
}
