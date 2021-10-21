import 'package:english_lettutor_app/utilities/constants/styles.dart';
import 'package:flutter/material.dart';

class TitleDetail extends StatelessWidget {
  const TitleDetail(
      {Key? key, required this.title, this.textStyle = titleStyle})
      : super(key: key);
  final String title;
  final TextStyle textStyle;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      child: Row(
        children: [
          Text(title,
              style: textStyle,
              overflow: TextOverflow.clip,
              softWrap: true,
              textAlign: TextAlign.justify),
        ],
      ),
    );
  }
}
