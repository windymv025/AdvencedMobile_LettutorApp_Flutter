import 'package:flutter/material.dart';

import 'infor.dart';

class InforAndChangeImage extends StatefulWidget {
  const InforAndChangeImage({Key? key, required this.image, this.onTap})
      : super(key: key);
  final GestureTapCallback? onTap;
  final DecorationImage image;

  @override
  _InforAndChangeImageState createState() => _InforAndChangeImageState();
}

class _InforAndChangeImageState extends State<InforAndChangeImage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Infor(
          image: widget.image,
          defaultSize: 10,
        ),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.fromLTRB(100, 140, 0, 0),
                padding: const EdgeInsets.all(3),
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Colors.white),
                child: InkWell(
                    onTap: widget.onTap,
                    child: const Icon(Icons.camera_alt_rounded)),
              )
            ],
          ),
        )
      ],
    );
  }
}
