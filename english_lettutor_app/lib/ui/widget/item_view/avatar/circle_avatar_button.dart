import 'package:flutter/material.dart';

class CircleAvatarButton extends StatefulWidget {
  const CircleAvatarButton({Key? key, this.image, this.onPressed, this.radius})
      : super(key: key);
  final VoidCallback? onPressed;
  final ImageProvider? image;
  final double? radius;

  @override
  _CircleAvatarButtonState createState() => _CircleAvatarButtonState();
}

class _CircleAvatarButtonState extends State<CircleAvatarButton> {
  @override
  Widget build(BuildContext context) {
    ImageProvider? _image = widget.image;
    _image ??= const AssetImage("assets/images/user-icon.png");

    return IconButton(
        onPressed: widget.onPressed,
        icon: CircleAvatar(
            backgroundColor: Colors.blue,
            radius: widget.radius! + 2,
            child: Expanded(
              child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: widget.radius,
                backgroundImage: _image,
              ),
            )));
  }
}
