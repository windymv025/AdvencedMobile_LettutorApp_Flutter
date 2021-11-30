import 'package:english_lettutor_app/ui/screen/become_teacher/become_teacher_screen.dart';
import 'package:english_lettutor_app/ui/screen/course_detail/course_detail_screen.dart';
import 'package:english_lettutor_app/ui/screen/courses/courses_screen.dart';
import 'package:english_lettutor_app/ui/screen/forgot_password/forgot_password_screen.dart';
import 'package:english_lettutor_app/ui/screen/history/schedule_history_screen.dart';
import 'package:english_lettutor_app/ui/screen/home/home_screen.dart';
import 'package:english_lettutor_app/ui/screen/lesson/lesson_screen.dart';
import 'package:english_lettutor_app/ui/screen/messenger/messenger_screen.dart';
import 'package:english_lettutor_app/ui/screen/messenger_detail/messenger_detail_screen.dart';
import 'package:english_lettutor_app/ui/screen/profile/profile_screen.dart';
import 'package:english_lettutor_app/ui/screen/reset_password_screen/reset_password_screen.dart';
import 'package:english_lettutor_app/ui/screen/schedule/schedule_screen.dart';
import 'package:english_lettutor_app/ui/screen/setting/setting_screen.dart';
import 'package:english_lettutor_app/ui/screen/sign_in/sign_in_screen.dart';
import 'package:english_lettutor_app/ui/screen/sign_up/sign_up_screen.dart';
import 'package:english_lettutor_app/ui/screen/splash/splash_screen.dart';
import 'package:english_lettutor_app/ui/screen/teacher_detail/teacher_detail_screen.dart';
import 'package:english_lettutor_app/ui/screen/teachers/teachers_screen.dart';
import 'package:flutter/material.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => const SplashScreen(),
  SignInScreen.routeName: (context) => const SignInScreen(),
  ForgotPasswordScreen.routeName: (context) => const ForgotPasswordScreen(),
  ResetPasswordScreen.routename: (context) => const ResetPasswordScreen(),
  SignUpScreen.routeName: (context) => const SignUpScreen(),
  HomeScreen.routeName: (context) => const HomeScreen(),
  ProfileScreen.routeName: (context) => const ProfileScreen(),
  CoursesScreen.routeName: (context) => const CoursesScreen(),
  TeachersScreen.routeName: (context) => const TeachersScreen(),
  TeacherDetailScreen.routeName: (context) => const TeacherDetailScreen(),
  CourseDetailScreen.routeName: (context) => const CourseDetailScreen(),
  ScheduleScreen.routeName: (context) => const ScheduleScreen(),
  SettingScreen.routeName: (context) => const SettingScreen(),
  ScheduleHistoryScreen.routeName: (context) => const ScheduleHistoryScreen(),
  BecomeTeacherScreen.routeName: (context) => const BecomeTeacherScreen(),
  LessonScreen.routeName: (context) => const LessonScreen(),
  MessengerScreen.routeName: (context) => const MessengerScreen(),
  MessengerDetailScreen.routeName: (context) => const MessengerDetailScreen(),
};
