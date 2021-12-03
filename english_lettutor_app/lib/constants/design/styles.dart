import 'dart:ui';

import 'package:flutter/material.dart';

import '../constants.dart';

const TextStyle titleStyle =
    TextStyle(fontSize: textSizeTitle, fontWeight: FontWeight.w700);
const TextStyle titleBlueStyle = TextStyle(
    color: kMainBlueColor,
    fontSize: textSizeTitle,
    fontWeight: FontWeight.w700);
const TextStyle titleStyleWhite = TextStyle(
    color: Colors.white, fontSize: textSizeTitle, fontWeight: FontWeight.w500);
const TextStyle pageNameStyle = TextStyle(
    color: kMainBlueColor,
    fontSize: textSizePageName,
    fontWeight: FontWeight.bold);
const TextStyle tileCountDownStyle = TextStyle(
    color: Colors.white,
    fontSize: textSizePageName,
    fontWeight: FontWeight.bold);
const TextStyle tileCountDownDarkStyle = TextStyle(
    color: Colors.black,
    fontSize: textSizePageName,
    fontWeight: FontWeight.bold);

const TextStyle subTileCountDownStyle = TextStyle(
    color: Colors.white, fontSize: textSizeTitle, fontWeight: FontWeight.bold);

const chipStyleOn = TextStyle(
    color: Colors.white, fontSize: textSizeTag, fontWeight: FontWeight.w800);

const chipStyleOff = TextStyle(
    color: kMainBlueColor, fontSize: textSizeTag, fontWeight: FontWeight.w800);

const chipStyleOffBlack = TextStyle(
    color: Colors.black87, fontSize: textSizeTag, fontWeight: FontWeight.w800);

final ButtonStyle outlineButtonStyle = ButtonStyle(
    backgroundColor: MaterialStateProperty.all(Colors.white),
    overlayColor: MaterialStateProperty.resolveWith<Color?>(
      (Set<MaterialState> states) {
        if (states.contains(MaterialState.hovered)) {
          return Colors.blue.withOpacity(0.04);
        }
        if (states.contains(MaterialState.focused) ||
            states.contains(MaterialState.pressed)) {
          return kMainBlueColor.withOpacity(0.12);
        }
        return null; // Defer to the widget's default.
      },
    ),
    foregroundColor: MaterialStateProperty.all(kMainBlueColor),
    shape: MaterialStateProperty.all(RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(18),
    )));

final textButtonStyle =
    TextButton.styleFrom(textStyle: const TextStyle(fontSize: textSizeButton));

final tagButtonStyleOn = ButtonStyle(
    backgroundColor: MaterialStateProperty.all(kMainBlueColor),
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
    foregroundColor: MaterialStateProperty.all(kMainBlueColor),
    shape: MaterialStateProperty.all(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(18))));

final tagButtonStyleOff = ButtonStyle(
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
    foregroundColor: MaterialStateProperty.all(Colors.lightBlueAccent),
    side: MaterialStateProperty.all(
        const BorderSide(color: Colors.lightBlueAccent)),
    shape: MaterialStateProperty.all(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(18))));

final defaultButtonStyle = ButtonStyle(
    backgroundColor: MaterialStateProperty.all(kPrimaryColor),
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
    foregroundColor: MaterialStateProperty.all(kPrimaryColor),
    shape: MaterialStateProperty.all(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(18))));

final defaultColorButtonStyle = ButtonStyle(
  backgroundColor: MaterialStateProperty.all(kPrimaryColor),
  overlayColor: MaterialStateProperty.resolveWith<Color?>(
    (Set<MaterialState> states) {
      if (states.contains(MaterialState.hovered)) {
        return Colors.white.withOpacity(0.04);
      }
      if (states.contains(MaterialState.focused) ||
          states.contains(MaterialState.pressed)) {
        return Colors.white.withOpacity(0.12);
      }
      return null; // Defer to the widget's default.
    },
  ),
  foregroundColor: MaterialStateProperty.all(Colors.white),
);

final ButtonStyle outlineColorButtonStyle = ButtonStyle(
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
);
