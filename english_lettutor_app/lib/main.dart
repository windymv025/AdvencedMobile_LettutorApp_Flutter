import 'package:english_lettutor_app/routes/routes.dart';
import 'package:english_lettutor_app/ui/screen/home/home_screen.dart';
import 'package:english_lettutor_app/ui/screen/splash/splash_screen.dart';
import 'package:english_lettutor_app/utilities/constants/theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'English Lettutor App',
      theme: theme(),
      // home: const HomeScreen(),
      routes: routes,
      initialRoute: SplashScreen.routeName,
    );
  }
}
