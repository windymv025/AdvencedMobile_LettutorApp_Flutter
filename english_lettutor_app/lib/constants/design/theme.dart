import 'package:flutter/material.dart';

import '../constants.dart';
import 'styles.dart';

final ThemeData themeData = theme();
ThemeData theme() {
  return ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white,
    inputDecorationTheme: inputDecorationTheme(),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    appBarTheme: appBarTheme(),
    textTheme: textTheme(),
  );
}

TextTheme textTheme() {
  return const TextTheme(bodyText1: titleStyle);
}

AppBarTheme appBarTheme() {
  return const AppBarTheme(
    color: Colors.white,
    elevation: 0,
    iconTheme: IconThemeData(color: Colors.black),
    titleTextStyle: pageNameStyle,
  );
}

InputDecorationTheme inputDecorationTheme() {
  OutlineInputBorder outlineEnabledBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(28),
    borderSide: const BorderSide(color: Colors.black54),
    gapPadding: 10,
  );
  OutlineInputBorder outlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(28),
    borderSide: const BorderSide(color: kMainBlueColor),
    gapPadding: 10,
  );
  OutlineInputBorder errorOutlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(28),
    borderSide: const BorderSide(color: Colors.red),
    gapPadding: 10,
  );
  OutlineInputBorder disabledOutlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(28),
    borderSide: const BorderSide(color: Colors.grey),
    gapPadding: 10,
  );
  return InputDecorationTheme(
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 40,
        vertical: 20,
      ),
      enabledBorder: outlineEnabledBorder,
      errorBorder: errorOutlineInputBorder,
      disabledBorder: disabledOutlineInputBorder,
      focusedErrorBorder: errorOutlineInputBorder,
      focusedBorder: outlineInputBorder,
      focusColor: kMainBlueColor);
}

final ThemeData themeDataDark = ThemeData(
  brightness: Brightness.dark,
  scaffoldBackgroundColor: Colors.black87,
  inputDecorationTheme: inputDecorationDarkTheme(),
  visualDensity: VisualDensity.adaptivePlatformDensity,
  appBarTheme: appBarDarkTheme(),
  textTheme: textThemeDark(),
);

InputDecorationTheme inputDecorationDarkTheme() {
  OutlineInputBorder outlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(28),
    borderSide: const BorderSide(color: kMainBlueColor),
    gapPadding: 10,
  );
  OutlineInputBorder outlineEnabledBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(28),
    borderSide: const BorderSide(color: Colors.white),
    gapPadding: 10,
  );
  OutlineInputBorder errorOutlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(28),
    borderSide: const BorderSide(color: Colors.red),
    gapPadding: 10,
  );
  OutlineInputBorder disabledOutlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(28),
    borderSide: const BorderSide(color: Colors.grey),
    gapPadding: 10,
  );
  return InputDecorationTheme(
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 40,
        vertical: 20,
      ),
      enabledBorder: outlineEnabledBorder,
      errorBorder: errorOutlineInputBorder,
      disabledBorder: disabledOutlineInputBorder,
      focusedErrorBorder: errorOutlineInputBorder,
      focusedBorder: outlineInputBorder,
      focusColor: kMainBlueColor);
}

AppBarTheme appBarDarkTheme() {
  return const AppBarTheme(
    color: Colors.black87,
    elevation: 0,
    iconTheme: IconThemeData(color: Colors.white),
    titleTextStyle: pageNameStyle,
  );
}

TextTheme textThemeDark() {
  return const TextTheme(
      headline1: pageNameStyle,
      headline2: titleStyle,
      headline3: titleBlueStyle,
      headline4: titleStyleWhite,
      headline5: tileCountDownStyle,
      subtitle1: subTileCountDownStyle,
      bodyText1: titleStyle);
}
