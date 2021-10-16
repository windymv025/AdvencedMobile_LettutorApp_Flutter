import 'package:flutter/cupertino.dart';

const double textSizeButton = 14;
const double textSizeTitle = 17;
const double textSizePageName = 20;

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
