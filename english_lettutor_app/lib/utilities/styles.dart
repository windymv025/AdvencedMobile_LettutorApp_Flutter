import 'dart:ui';

import 'package:english_lettutor_app/utilities/constants.dart';
import 'package:flutter/material.dart';

class Styles{
  static const TextStyle titleStyle = TextStyle(
      color: Colors.black,
      fontSize: Constants.textSizeTitle,
      fontWeight: FontWeight.w500);
  static const TextStyle pageNameStyle = TextStyle(
      color: Colors.blue,
      fontSize: Constants.textSizePageName,
      fontWeight: FontWeight.bold);
  static const TextStyle tileCountDownStyle = TextStyle(
      color: Colors.white,
      fontSize: Constants.textSizeTitle,
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