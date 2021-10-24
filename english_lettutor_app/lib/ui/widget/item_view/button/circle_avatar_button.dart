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
    ImageProvider? _image = widget.image;
    _image ??= const AssetImage("assets/images/user-icon.png");
    Color _color = widget.color!;
    if (widget.isOnline == true) {
      _color = const Color(0xff33CD1A);
    } else if (widget.isOnline == false) {
      _color = Colors.red;
    }

    return InkWell(
      onTap: widget.onPressed,
      child: Container(
        padding: EdgeInsets.only(right: widget.isOnline == null ? 0 : 8),
        child: Stack(
          children: [
            CircleAvatar(
              backgroundColor: _color,
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: Expanded(
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    backgroundImage: _image,
                  ),
                ),
              ),
            ),
            widget.isOnline == null
                ? const SizedBox.square()
                : Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: 12,
                      height: 12,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _color,
                      ),
                    ))
          ],
        ),
      ),
    );
  }
}
