import 'package:english_lettutor_app/constants/constants.dart';
import 'package:flutter/material.dart';

class BoderInput extends StatefulWidget {
  const BoderInput(
      {Key? key, required this.icon, required this.title, required this.child})
      : super(key: key);
  final Widget? child;
  final String title;
  final IconData icon;

  @override
  _BoderInputState createState() => _BoderInputState();
}

class _BoderInputState extends State<BoderInput> {
  Color _color = Colors.grey;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onForcePressEnd: (forcus) {
        setState(() {
          _color = Colors.grey;
        });
      },
      onForcePressStart: (focus) {
        setState(() {
          _color = kMainBlueColor;
        });
      },
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 7),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 7),
              child: Row(
                children: [
                  const SizedBox(
                    width: 30,
                  ),
                  Expanded(
                    child: widget.child ?? const SizedBox.shrink(),
                  ),
                  Icon(
                    widget.icon,
                    color: _color,
                  ),
                ],
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(28),
                  border: Border.all(color: kMainBlueColor)),
            ),
          ),
          Container(
            color: Colors.white,
            margin: const EdgeInsets.only(left: 30),
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: Text(widget.title,
                style: TextStyle(color: _color, fontSize: 12)),
          ),
        ],
      ),
    );
  }
}
