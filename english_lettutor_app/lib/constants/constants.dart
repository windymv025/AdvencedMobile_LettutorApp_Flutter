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
const String kOTPNullError = "Please Enter OTP in your email";
const String kOTPError = "OTP is Invalid, please try again";

// const kMainBlueColor = Color(0xff18A9FB);
const kMainBlueColor = Color(0xff248EEF);
const kPrimaryColor = Color(0xff1B67D9);
const kCardTeacherColor = Color(0xff127A90);
const kCardColor = Color(0xff128190);
const kDarkColor = Color(0xff222222);

//size screen

const kMobileBreakpoint = 576;
const kTabletBreakpoint = 1024;
const kDesktopBreakPoint = 1366;

const kWithMinDefault = 315;
const kHeightMinDefault = 540;

const kStringDarkTheme = "Dark";
const kStringLightTheme = "Light";
const kThemes = [kStringDarkTheme, kStringLightTheme];

const kLevels = [
  "Beginner",
  "Higher Beginner",
  "Pre-Intermediate",
  "Intermediate",
  "Upper-intermediate",
  "Advanced",
  "Proficiency"
];

const kCountries = ["Viet Nam", "Uzbekistan", "United States of America"];

const String sep1Content =
    """Your tutor profile is your chance to market yourself to students on Tutoring. You can make edits later on your profile settings page.

New students may browse tutor profiles to find a tutor that fits their learning goals and personality. Returning students may use the tutor profiles to find tutors they've had great experiences with already.""";

const String step2Content =
    "Let students know what they can expect from a lesson with you by recording a video highlighting your teaching style, expertise and personality. Students can be nervous to speak with a foreigner, so it really helps to have a friendly video that introduces yourself and invites students to call you.";

const String videoTips = """A few helpful tips:
1. Find a clean and quiet space
2. Smile and look at the camera
3. Dress smart
4. Speak for 1-3 minutes
5. Brand yourself and have fun!""";

const String dot = " • ";
