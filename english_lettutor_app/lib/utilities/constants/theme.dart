import 'package:english_lettutor_app/utilities/constants/styles.dart';
import 'package:flutter/material.dart';

import 'constants.dart';

ThemeData theme() {
  return ThemeData(
    scaffoldBackgroundColor: Colors.white,
    inputDecorationTheme: inputDecorationTheme(),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    appBarTheme: appBarTheme(),
  );
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
        vertical: 0,
      ),
      enabledBorder: outlineInputBorder,
      errorBorder: errorOutlineInputBorder,
      disabledBorder: disabledOutlineInputBorder,
      focusedErrorBorder: errorOutlineInputBorder,
      focusedBorder: outlineInputBorder,
      focusColor: kMainBlueColor);
}
