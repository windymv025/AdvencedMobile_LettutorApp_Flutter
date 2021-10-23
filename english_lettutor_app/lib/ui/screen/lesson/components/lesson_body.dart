import 'package:flutter/material.dart';

class LessonBody extends StatefulWidget {
  const LessonBody({Key? key}) : super(key: key);

  @override
  _LessonBodyState createState() => _LessonBodyState();
}

class _LessonBodyState extends State<LessonBody> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: Colors.grey,
      ),
    );
  }
}
