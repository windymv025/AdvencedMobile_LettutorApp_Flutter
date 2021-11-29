import 'package:english_lettutor_app/data/sharedpref/shared_preference_helper.dart';
import 'package:english_lettutor_app/ui/screen/sign_in/sign_in_screen.dart';
import 'package:english_lettutor_app/ui/screen/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'constants/design/theme.dart';
import 'models/Theme/theme_model.dart';
import 'utilities/routes/routes.dart';

void main() {
  runApp(ChangeNotifierProvider<ThemeModel>(
    create: (_) => ThemeModel(),
    child: const MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  SharedPreferenceHelper? sharedPreferenceHelper;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() async {
    var sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferenceHelper = SharedPreferenceHelper(sharedPreferences);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeModel>(
      builder: (context, themeModel, child) => MultiProvider(
        providers: [
          Provider(create: (context) => sharedPreferenceHelper),
        ],
        child: MaterialApp(
          title: 'English Lettutor App',
          theme: themeModel.themeMode,
          darkTheme: themeDataDark,
          themeMode: ThemeMode.system,
          home: const SignInScreen(),
          routes: routes,
          initialRoute: SplashScreen.routeName,
        ),
      ),
    );
  }
}
