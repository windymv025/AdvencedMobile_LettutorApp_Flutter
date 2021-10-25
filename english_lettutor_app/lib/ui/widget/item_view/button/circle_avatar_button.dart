import 'package:english_lettutor_app/utilities/constants/constants.dart';
import 'package:flutter/material.dart';

class CircleAvatarButton extends StatefulWidget {
  const CircleAvatarButton(
      {Key? key,
      this.image,
      this.onPressed,
      this.color = kMainBlueColor,
      this.isOnline})
      : super(key: key);
  final VoidCallback? onPressed;
  final ImageProvider? image;
  final Color? color;
  final bool? isOnline;

  @override
  _CircleAvatarButtonState createState() => _CircleAvatarButtonState();
}

class _CircleAvatarButtonState extends State<CircleAvatarButton> {
  @override
  Widget build(BuildContext context) {
    ImageProvider? _image;

    if (widget.image != null) {
      _image = widget.image;
    } else {
      _image = const AssetImage("assets/images/user-icon.png");
    }
    Color _color = widget.color ?? kMainBlueColor;
    if (widget.isOnline == true) {
      _color = Colors.greenAccent.shade400;
    } else if (widget.isOnline == false) {
      _color = Colors.red;
    }

    return InkWell(
      onTap: widget.onPressed,
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: _color, width: 2),
              shape: BoxShape.circle,
              color: _color,
            ),
            child: Expanded(
              child: CircleAvatar(
                backgroundColor: Colors.white,
                backgroundImage: _image,
              ),
            ),
          ),
          widget.isOnline == null
              ? const SizedBox(
                  width: 0,
                  height: 0,
                )
              : Positioned(
                  bottom: 0,
                  right: 3,
                  child: Container(
                    width: 12,
                    height: 12,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _color,
                      border: Border.all(color: Colors.white, width: 1),
                    ),
                  ),
                )
        ],
      ),
    );
  }
}
