import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Constants {
  static const double textSizeButton = 14;
  static const double textSizeTitle = 17;
  static const double textSizePageName = 20;

  static const TextStyle titleStyle = TextStyle(
      color: Colors.black,
      fontSize: textSizeTitle,
      fontWeight: FontWeight.w500);
  static const TextStyle pageNameStyle = TextStyle(
      color: Colors.blue,
      fontSize: textSizePageName,
      fontWeight: FontWeight.bold);
  static const TextStyle tileCountDownStyle = TextStyle(
      color: Colors.white,
      fontSize: textSizeTitle,
      fontWeight: FontWeight.bold);

  static final ButtonStyle outlineButtonStyle = ButtonStyle(
      backgroundColor: MaterialStateProperty.all(Colors.white),
      overlayColor: MaterialStateProperty.resolveWith<Color?>(
        (Set<MaterialState> states) {
          if (states.contains(MaterialState.hovered)) {
            return Colors.blue.withOpacity(0.04);
          }
          if (states.contains(MaterialState.focused) ||
              states.contains(MaterialState.pressed)) {
            return Colors.blue.withOpacity(0.12);
          }
          return null; // Defer to the widget's default.
        },
      ),
      foregroundColor: MaterialStateProperty.all(Colors.blue),
      shape: MaterialStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(18))));

  static final textButtonStyle = TextButton.styleFrom(
      textStyle: const TextStyle(fontSize: Constants.textSizeButton));
}
