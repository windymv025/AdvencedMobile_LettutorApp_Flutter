import 'package:english_lettutor_app/constants/constants.dart';
import 'package:flutter/material.dart';

class PageButton extends StatefulWidget {
  const PageButton({
    Key? key,
    required this.onPressed,
    required this.text,
  }) : super(key: key);
  final VoidCallback? onPressed;
  final String? text;

  @override
  _PageButtonState createState() => _PageButtonState();
}

class _PageButtonState extends State<PageButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        margin: const EdgeInsets.symmetric(horizontal: 5),
        constraints: const BoxConstraints(
          minWidth: 35,
        ),
        height: 35,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: kMainBlueColor,
            width: 1,
          ),
        ),
        child: Text(
          widget.text ?? '',
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: kMainBlueColor,
          ),
        ),
      ),
    );
  }
}
