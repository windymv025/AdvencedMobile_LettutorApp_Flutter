import 'package:english_lettutor_app/data/provider/course_dto.dart';
import 'package:english_lettutor_app/data/provider/language_profile.dart';
import 'package:english_lettutor_app/data/provider/profile_provider.dart';
import 'package:english_lettutor_app/data/provider/schedule_history_dto.dart';
import 'package:english_lettutor_app/data/provider/teacher_dto.dart';
import 'package:english_lettutor_app/ui/screen/sign_in/sign_in_screen.dart';
import 'package:english_lettutor_app/ui/screen/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

import 'constants/design/theme.dart';
import 'data/local_data_test.dart';
import 'data/provider/home_state.dart';
import 'data/provider/schedule_dto.dart';
import 'generated/l10n.dart';
import 'models/Theme/theme_model.dart';
import 'utilities/routes/routes.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<ThemeModel>(create: (_) => ThemeModel()),
      ChangeNotifierProvider<LanguageProfile>(create: (_) => LanguageProfile()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // SharedPreferenceHelper? sharedPreferenceHelper;
  ProfileProvider profile = ProfileProvider();
  CourseDTO courseDTO = CourseDTO();
  ScheduleDTO scheduleDTO = ScheduleDTO();
  ScheduleHistoryDTO scheduleHistoryDTO = ScheduleHistoryDTO();

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // loadData();
  }

  void loadData() {
    randomData();
  }

  @override
  Widget build(BuildContext context) {
    ThemeModel themeModel = Provider.of<ThemeModel>(context);
    LanguageProfile languageProfile = Provider.of<LanguageProfile>(context);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => profile),
        ChangeNotifierProvider(create: (context) => courseDTO),
        ChangeNotifierProvider(create: (context) => TeacherDTO()),
        ChangeNotifierProvider(create: (context) => scheduleDTO),
        ChangeNotifierProvider(create: (context) => HomeState()),
        ChangeNotifierProvider(create: (context) => scheduleHistoryDTO),
      ],
      child: MaterialApp(
        title: 'English Lettutor App',
        theme: themeModel.themeMode,
        darkTheme: themeDataDark,
        themeMode: ThemeMode.system,
        home: const SignInScreen(),
        routes: routes,
        initialRoute: SplashScreen.routeName,
        locale: languageProfile.locale,
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
      ),
    );
  }
}
