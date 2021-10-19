import 'package:flutter/cupertino.dart';

const double textSizeButton = 14;
const double textSizeTag = 12;
const double textSizeTitle = 16;
const double textSizePageName = 18;

// Form Error
final RegExp emailValidatorRegExp =
    RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
const String kEmailNullError = "Please Enter your email";
const String kInvalidEmailError = "Please Enter Valid Email";
const String kPassNullError = "Please Enter your password";
const String kShortPassError = "Password is too short";
const String kMatchPassError = "Passwords don't match";
const String kNamelNullError = "Please Enter your name";

// const kMainBlueColor = Color(0xff18A9FB);
const kMainBlueColor = Color(0xff248EEF);
const kPrimaryColor = Color(0xff1B67D9);
const kCardTeacherColor = Color(0xff127A90);
const kCardColor = Color(0xff128190);

//size screen

const kMobileBreakpoint = 576;
const kTabletBreakpoint = 1024;
const kDesktopBreakPoint = 1366;

const kWithMinDefault = 315;
const kHeightMinDefault = 540;
