import 'package:flutter/material.dart';

class VideoIntroduce extends StatefulWidget {
  const VideoIntroduce({Key? key, required this.uri}) : super(key: key);
  final String uri;
  @override
  _VideoIntroduceState createState() => _VideoIntroduceState();
}

class _VideoIntroduceState extends State<VideoIntroduce> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      color: Colors.grey,
      child: Row(
        children: [const Spacer(), Text(widget.uri), const Spacer()],
      ),
    );
  }
}
