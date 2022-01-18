// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Let's Start!`
  String get let_start {
    return Intl.message(
      'Let\'s Start!',
      name: 'let_start',
      desc: '',
      args: [],
    );
  }

  /// `Sign In`
  String get sign_in {
    return Intl.message(
      'Sign In',
      name: 'sign_in',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up`
  String get sign_up {
    return Intl.message(
      'Sign Up',
      name: 'sign_up',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Enter your email`
  String get enter_email {
    return Intl.message(
      'Enter your email',
      name: 'enter_email',
      desc: '',
      args: [],
    );
  }

  /// `Enter your password`
  String get enter_password {
    return Intl.message(
      'Enter your password',
      name: 'enter_password',
      desc: '',
      args: [],
    );
  }

  /// `Or continue with`
  String get or_continue_with {
    return Intl.message(
      'Or continue with',
      name: 'or_continue_with',
      desc: '',
      args: [],
    );
  }

  /// `Don't have an account?`
  String get dont_have_account {
    return Intl.message(
      'Don\'t have an account?',
      name: 'dont_have_account',
      desc: '',
      args: [],
    );
  }

  /// `Please enter valid email`
  String get please_enter_email_valid {
    return Intl.message(
      'Please enter valid email',
      name: 'please_enter_email_valid',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your password`
  String get please_enter_password {
    return Intl.message(
      'Please enter your password',
      name: 'please_enter_password',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your email`
  String get please_enter_email {
    return Intl.message(
      'Please enter your email',
      name: 'please_enter_email',
      desc: '',
      args: [],
    );
  }

  /// `Please enter password minimum 8 characters`
  String get please_enter_password_min {
    return Intl.message(
      'Please enter password minimum 8 characters',
      name: 'please_enter_password_min',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your name`
  String get please_enter_your_name {
    return Intl.message(
      'Please enter your name',
      name: 'please_enter_your_name',
      desc: '',
      args: [],
    );
  }

  /// `Password don't match`
  String get password_dont_match {
    return Intl.message(
      'Password don\'t match',
      name: 'password_dont_match',
      desc: '',
      args: [],
    );
  }

  /// `Please Enter OTP in your email`
  String get please_enter_otp {
    return Intl.message(
      'Please Enter OTP in your email',
      name: 'please_enter_otp',
      desc: '',
      args: [],
    );
  }

  /// `OTP is Invalid, please try again`
  String get otp_is_invalid {
    return Intl.message(
      'OTP is Invalid, please try again',
      name: 'otp_is_invalid',
      desc: '',
      args: [],
    );
  }

  /// `Dark`
  String get dark {
    return Intl.message(
      'Dark',
      name: 'dark',
      desc: '',
      args: [],
    );
  }

  /// `Light`
  String get light {
    return Intl.message(
      'Light',
      name: 'light',
      desc: '',
      args: [],
    );
  }

  /// `Beginner`
  String get beginner {
    return Intl.message(
      'Beginner',
      name: 'beginner',
      desc: '',
      args: [],
    );
  }

  /// `Higher Beginner`
  String get higher_beginner {
    return Intl.message(
      'Higher Beginner',
      name: 'higher_beginner',
      desc: '',
      args: [],
    );
  }

  /// `Pre-Intermediate`
  String get pre_Intermediate {
    return Intl.message(
      'Pre-Intermediate',
      name: 'pre_Intermediate',
      desc: '',
      args: [],
    );
  }

  /// `Intermediate`
  String get Intermediate {
    return Intl.message(
      'Intermediate',
      name: 'Intermediate',
      desc: '',
      args: [],
    );
  }

  /// `Upper-intermediate`
  String get upper_intermediate {
    return Intl.message(
      'Upper-intermediate',
      name: 'upper_intermediate',
      desc: '',
      args: [],
    );
  }

  /// `Advanced`
  String get advanced {
    return Intl.message(
      'Advanced',
      name: 'advanced',
      desc: '',
      args: [],
    );
  }

  /// `Proficiency`
  String get proficiency {
    return Intl.message(
      'Proficiency',
      name: 'proficiency',
      desc: '',
      args: [],
    );
  }

  /// `All`
  String get all {
    return Intl.message(
      'All',
      name: 'all',
      desc: '',
      args: [],
    );
  }

  /// `A few helpful tips:\n1. Find a clean and quiet space\n2. Smile and look at the camera\n3. Dress smart\n4. Speak for 1-3 minutes\n5. Brand yourself and have fun!`
  String get video_tips {
    return Intl.message(
      'A few helpful tips:\n1. Find a clean and quiet space\n2. Smile and look at the camera\n3. Dress smart\n4. Speak for 1-3 minutes\n5. Brand yourself and have fun!',
      name: 'video_tips',
      desc: '',
      args: [],
    );
  }

  /// `Forgot Password?`
  String get forgot_password {
    return Intl.message(
      'Forgot Password?',
      name: 'forgot_password',
      desc: '',
      args: [],
    );
  }

  /// `Enter your email address to we'll send you a OTP code to reset your password`
  String get enter_email_to_reset {
    return Intl.message(
      'Enter your email address to we\'ll send you a OTP code to reset your password',
      name: 'enter_email_to_reset',
      desc: '',
      args: [],
    );
  }

  /// `Or continue with`
  String get continue_with {
    return Intl.message(
      'Or continue with',
      name: 'continue_with',
      desc: '',
      args: [],
    );
  }

  /// `Introduce yourself`
  String get introduce_yourself {
    return Intl.message(
      'Introduce yourself',
      name: 'introduce_yourself',
      desc: '',
      args: [],
    );
  }

  /// `Introduction video`
  String get introduction_video {
    return Intl.message(
      'Introduction video',
      name: 'introduction_video',
      desc: '',
      args: [],
    );
  }

  /// `Pick a video`
  String get pick_a_video {
    return Intl.message(
      'Pick a video',
      name: 'pick_a_video',
      desc: '',
      args: [],
    );
  }

  /// `Take a video`
  String get take_video {
    return Intl.message(
      'Take a video',
      name: 'take_video',
      desc: '',
      args: [],
    );
  }

  /// `Pick your date`
  String get pick_date {
    return Intl.message(
      'Pick your date',
      name: 'pick_date',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Please select country`
  String get please_select_country {
    return Intl.message(
      'Please select country',
      name: 'please_select_country',
      desc: '',
      args: [],
    );
  }

  /// `Country`
  String get country {
    return Intl.message(
      'Country',
      name: 'country',
      desc: '',
      args: [],
    );
  }

  /// `Select your Country`
  String get Select_your_country {
    return Intl.message(
      'Select your Country',
      name: 'Select_your_country',
      desc: '',
      args: [],
    );
  }

  /// `Please choose a date`
  String get please_choose_a_date {
    return Intl.message(
      'Please choose a date',
      name: 'please_choose_a_date',
      desc: '',
      args: [],
    );
  }

  /// `No reviews yet`
  String get no_reviews_yet {
    return Intl.message(
      'No reviews yet',
      name: 'no_reviews_yet',
      desc: '',
      args: [],
    );
  }

  /// `Lessons`
  String get lessons {
    return Intl.message(
      'Lessons',
      name: 'lessons',
      desc: '',
      args: [],
    );
  }

  /// `Languages`
  String get languages {
    return Intl.message(
      'Languages',
      name: 'languages',
      desc: '',
      args: [],
    );
  }

  /// `Education`
  String get education {
    return Intl.message(
      'Education',
      name: 'education',
      desc: '',
      args: [],
    );
  }

  /// `Experience`
  String get experience {
    return Intl.message(
      'Experience',
      name: 'experience',
      desc: '',
      args: [],
    );
  }

  /// `Interests`
  String get interests {
    return Intl.message(
      'Interests',
      name: 'interests',
      desc: '',
      args: [],
    );
  }

  /// `Profession`
  String get profession {
    return Intl.message(
      'Profession',
      name: 'profession',
      desc: '',
      args: [],
    );
  }

  /// `Specialties`
  String get specialties {
    return Intl.message(
      'Specialties',
      name: 'specialties',
      desc: '',
      args: [],
    );
  }

  /// `Rating and Comments`
  String get rating_and_comments {
    return Intl.message(
      'Rating and Comments',
      name: 'rating_and_comments',
      desc: '',
      args: [],
    );
  }

  /// `Enter your name`
  String get enter_your_name {
    return Intl.message(
      'Enter your name',
      name: 'enter_your_name',
      desc: '',
      args: [],
    );
  }

  /// `Full name`
  String get full_name {
    return Intl.message(
      'Full name',
      name: 'full_name',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Password`
  String get confirm_password {
    return Intl.message(
      'Confirm Password',
      name: 'confirm_password',
      desc: '',
      args: [],
    );
  }

  /// `Re-enter your password`
  String get re_enter_your_password {
    return Intl.message(
      'Re-enter your password',
      name: 're_enter_your_password',
      desc: '',
      args: [],
    );
  }

  /// `Already have an account? `
  String get have_an_account {
    return Intl.message(
      'Already have an account? ',
      name: 'have_an_account',
      desc: '',
      args: [],
    );
  }

  /// `Setting`
  String get setting {
    return Intl.message(
      'Setting',
      name: 'setting',
      desc: '',
      args: [],
    );
  }

  /// `Theme`
  String get theme {
    return Intl.message(
      'Theme',
      name: 'theme',
      desc: '',
      args: [],
    );
  }

  /// `Reset Password`
  String get reset_password {
    return Intl.message(
      'Reset Password',
      name: 'reset_password',
      desc: '',
      args: [],
    );
  }

  /// `Enter a new password`
  String get enter_new_password {
    return Intl.message(
      'Enter a new password',
      name: 'enter_new_password',
      desc: '',
      args: [],
    );
  }

  /// `Your full name must be at least 3 characters long`
  String get err_name_short {
    return Intl.message(
      'Your full name must be at least 3 characters long',
      name: 'err_name_short',
      desc: '',
      args: [],
    );
  }

  /// `Your full name must contain only letters`
  String get err_name_invalid {
    return Intl.message(
      'Your full name must contain only letters',
      name: 'err_name_invalid',
      desc: '',
      args: [],
    );
  }

  /// `Phone number is required`
  String get err_null_phone {
    return Intl.message(
      'Phone number is required',
      name: 'err_null_phone',
      desc: '',
      args: [],
    );
  }

  /// `Phone number is invalid`
  String get err_phone_invalid {
    return Intl.message(
      'Phone number is invalid',
      name: 'err_phone_invalid',
      desc: '',
      args: [],
    );
  }

  /// `Phone number`
  String get phone_number {
    return Intl.message(
      'Phone number',
      name: 'phone_number',
      desc: '',
      args: [],
    );
  }

  /// `Enter your phone number`
  String get enter_phone {
    return Intl.message(
      'Enter your phone number',
      name: 'enter_phone',
      desc: '',
      args: [],
    );
  }

  /// `Birthday`
  String get birthday {
    return Intl.message(
      'Birthday',
      name: 'birthday',
      desc: '',
      args: [],
    );
  }

  /// `Select your birthday`
  String get select_your_birthday {
    return Intl.message(
      'Select your birthday',
      name: 'select_your_birthday',
      desc: '',
      args: [],
    );
  }

  /// `Choose your level`
  String get choose_your_level {
    return Intl.message(
      'Choose your level',
      name: 'choose_your_level',
      desc: '',
      args: [],
    );
  }

  /// `My level`
  String get mylevel {
    return Intl.message(
      'My level',
      name: 'mylevel',
      desc: '',
      args: [],
    );
  }

  /// `Please select at least one item`
  String get err_choose_short {
    return Intl.message(
      'Please select at least one item',
      name: 'err_choose_short',
      desc: '',
      args: [],
    );
  }

  /// `What do you want to learn?`
  String get want_to_learn {
    return Intl.message(
      'What do you want to learn?',
      name: 'want_to_learn',
      desc: '',
      args: [],
    );
  }

  /// `Choose Specialities`
  String get Choose_Specialities {
    return Intl.message(
      'Choose Specialities',
      name: 'Choose_Specialities',
      desc: '',
      args: [],
    );
  }

  /// `Save changes`
  String get save_changes {
    return Intl.message(
      'Save changes',
      name: 'save_changes',
      desc: '',
      args: [],
    );
  }

  /// `Profile updated`
  String get Profile_updated {
    return Intl.message(
      'Profile updated',
      name: 'Profile_updated',
      desc: '',
      args: [],
    );
  }

  /// `Please fill all fields`
  String get err_fill_all {
    return Intl.message(
      'Please fill all fields',
      name: 'err_fill_all',
      desc: '',
      args: [],
    );
  }

  /// `Not received OTP?`
  String get Not_received_OTP {
    return Intl.message(
      'Not received OTP?',
      name: 'Not_received_OTP',
      desc: '',
      args: [],
    );
  }

  /// `Submit`
  String get submit {
    return Intl.message(
      'Submit',
      name: 'submit',
      desc: '',
      args: [],
    );
  }

  /// `Enter OTP in your email`
  String get enter_OTP {
    return Intl.message(
      'Enter OTP in your email',
      name: 'enter_OTP',
      desc: '',
      args: [],
    );
  }

  /// `Check your email then enter the OTP code below`
  String get check_email_str {
    return Intl.message(
      'Check your email then enter the OTP code below',
      name: 'check_email_str',
      desc: '',
      args: [],
    );
  }

  /// `Type a message`
  String get type_message {
    return Intl.message(
      'Type a message',
      name: 'type_message',
      desc: '',
      args: [],
    );
  }

  /// `Delete`
  String get delete {
    return Intl.message(
      'Delete',
      name: 'delete',
      desc: '',
      args: [],
    );
  }

  /// `Days`
  String get Days {
    return Intl.message(
      'Days',
      name: 'Days',
      desc: '',
      args: [],
    );
  }

  /// `Hours`
  String get Hours {
    return Intl.message(
      'Hours',
      name: 'Hours',
      desc: '',
      args: [],
    );
  }

  /// `Minutes`
  String get Minutes {
    return Intl.message(
      'Minutes',
      name: 'Minutes',
      desc: '',
      args: [],
    );
  }

  /// `Seconds`
  String get Seconds {
    return Intl.message(
      'Seconds',
      name: 'Seconds',
      desc: '',
      args: [],
    );
  }

  /// `until lesson starts`
  String get until_lesson_starts {
    return Intl.message(
      'until lesson starts',
      name: 'until_lesson_starts',
      desc: '',
      args: [],
    );
  }

  /// `Filter teachers by Specialization`
  String get filter_teachers {
    return Intl.message(
      'Filter teachers by Specialization',
      name: 'filter_teachers',
      desc: '',
      args: [],
    );
  }

  /// `Total lesson time is`
  String get total_lesson_time {
    return Intl.message(
      'Total lesson time is',
      name: 'total_lesson_time',
      desc: '',
      args: [],
    );
  }

  /// `Upcoming lesson`
  String get upcoming_lesson {
    return Intl.message(
      'Upcoming lesson',
      name: 'upcoming_lesson',
      desc: '',
      args: [],
    );
  }

  /// `Enter lesson room`
  String get enter_lesson_room {
    return Intl.message(
      'Enter lesson room',
      name: 'enter_lesson_room',
      desc: '',
      args: [],
    );
  }

  /// `Recommended Course`
  String get Recommended_Course {
    return Intl.message(
      'Recommended Course',
      name: 'Recommended_Course',
      desc: '',
      args: [],
    );
  }

  /// `More`
  String get More {
    return Intl.message(
      'More',
      name: 'More',
      desc: '',
      args: [],
    );
  }

  /// `Recommended Teacher`
  String get Recommended_Teacher {
    return Intl.message(
      'Recommended Teacher',
      name: 'Recommended_Teacher',
      desc: '',
      args: [],
    );
  }

  /// `Welcome to English LetTutor App!`
  String get wellcome_lettutor {
    return Intl.message(
      'Welcome to English LetTutor App!',
      name: 'wellcome_lettutor',
      desc: '',
      args: [],
    );
  }

  /// `Booking now`
  String get booking_now {
    return Intl.message(
      'Booking now',
      name: 'booking_now',
      desc: '',
      args: [],
    );
  }

  /// `Filter courses`
  String get filter_courses {
    return Intl.message(
      'Filter courses',
      name: 'filter_courses',
      desc: '',
      args: [],
    );
  }

  /// `Schedule History`
  String get schedule_history {
    return Intl.message(
      'Schedule History',
      name: 'schedule_history',
      desc: '',
      args: [],
    );
  }

  /// `Send message`
  String get send_message {
    return Intl.message(
      'Send message',
      name: 'send_message',
      desc: '',
      args: [],
    );
  }

  /// `Give Feedback`
  String get give_feedback {
    return Intl.message(
      'Give Feedback',
      name: 'give_feedback',
      desc: '',
      args: [],
    );
  }

  /// `Send`
  String get send {
    return Intl.message(
      'Send',
      name: 'send',
      desc: '',
      args: [],
    );
  }

  /// `Favorite Teachers`
  String get favorite_teachers {
    return Intl.message(
      'Favorite Teachers',
      name: 'favorite_teachers',
      desc: '',
      args: [],
    );
  }

  /// `Overview`
  String get overview {
    return Intl.message(
      'Overview',
      name: 'overview',
      desc: '',
      args: [],
    );
  }

  /// `Why take this course?`
  String get why_take_this_course {
    return Intl.message(
      'Why take this course?',
      name: 'why_take_this_course',
      desc: '',
      args: [],
    );
  }

  /// `What will you be able to do?`
  String get what_be_able_to_do {
    return Intl.message(
      'What will you be able to do?',
      name: 'what_be_able_to_do',
      desc: '',
      args: [],
    );
  }

  /// `Experience Level`
  String get experience_level {
    return Intl.message(
      'Experience Level',
      name: 'experience_level',
      desc: '',
      args: [],
    );
  }

  /// `Course Length`
  String get course_length {
    return Intl.message(
      'Course Length',
      name: 'course_length',
      desc: '',
      args: [],
    );
  }

  /// `List Topics`
  String get list_topics {
    return Intl.message(
      'List Topics',
      name: 'list_topics',
      desc: '',
      args: [],
    );
  }

  /// `Become a Teacher`
  String get become_teacher {
    return Intl.message(
      'Become a Teacher',
      name: 'become_teacher',
      desc: '',
      args: [],
    );
  }

  /// `Back`
  String get back {
    return Intl.message(
      'Back',
      name: 'back',
      desc: '',
      args: [],
    );
  }

  /// `Continue`
  String get continue_str {
    return Intl.message(
      'Continue',
      name: 'continue_str',
      desc: '',
      args: [],
    );
  }

  /// `Finish`
  String get finish {
    return Intl.message(
      'Finish',
      name: 'finish',
      desc: '',
      args: [],
    );
  }

  /// `Complete profile`
  String get complete_profile {
    return Intl.message(
      'Complete profile',
      name: 'complete_profile',
      desc: '',
      args: [],
    );
  }

  /// `Video introduction`
  String get video_introduction {
    return Intl.message(
      'Video introduction',
      name: 'video_introduction',
      desc: '',
      args: [],
    );
  }

  /// `Approval`
  String get approval {
    return Intl.message(
      'Approval',
      name: 'approval',
      desc: '',
      args: [],
    );
  }

  /// `My specialties are`
  String get my_specialties_are {
    return Intl.message(
      'My specialties are',
      name: 'my_specialties_are',
      desc: '',
      args: [],
    );
  }

  /// `You have done all the steps`
  String get you_have_done_all_steps {
    return Intl.message(
      'You have done all the steps',
      name: 'you_have_done_all_steps',
      desc: '',
      args: [],
    );
  }

  /// `Please, wait for the operator's approval`
  String get please_wait_accept {
    return Intl.message(
      'Please, wait for the operator\'s approval',
      name: 'please_wait_accept',
      desc: '',
      args: [],
    );
  }

  /// `Languages I speak`
  String get languages_speak {
    return Intl.message(
      'Languages I speak',
      name: 'languages_speak',
      desc: '',
      args: [],
    );
  }

  /// `Choose language`
  String get choose_language {
    return Intl.message(
      'Choose language',
      name: 'choose_language',
      desc: '',
      args: [],
    );
  }

  /// `Who I teach`
  String get who_i_teach {
    return Intl.message(
      'Who I teach',
      name: 'who_i_teach',
      desc: '',
      args: [],
    );
  }

  /// `Introduction`
  String get introduction {
    return Intl.message(
      'Introduction',
      name: 'introduction',
      desc: '',
      args: [],
    );
  }

  /// `I am best at teaching students who are`
  String get i_best_teaching_who {
    return Intl.message(
      'I am best at teaching students who are',
      name: 'i_best_teaching_who',
      desc: '',
      args: [],
    );
  }

  /// `Set up your tutor profile`
  String get set_up_profile {
    return Intl.message(
      'Set up your tutor profile',
      name: 'set_up_profile',
      desc: '',
      args: [],
    );
  }

  /// `Basic info`
  String get basic_info {
    return Intl.message(
      'Basic info',
      name: 'basic_info',
      desc: '',
      args: [],
    );
  }

  /// `Please upload your professional photo.\nSee guidelines`
  String get please_upload_photo_guidelines {
    return Intl.message(
      'Please upload your professional photo.\nSee guidelines',
      name: 'please_upload_photo_guidelines',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get search {
    return Intl.message(
      'Search',
      name: 'search',
      desc: '',
      args: [],
    );
  }

  /// `Previous`
  String get previous {
    return Intl.message(
      'Previous',
      name: 'previous',
      desc: '',
      args: [],
    );
  }

  /// `Next`
  String get next {
    return Intl.message(
      'Next',
      name: 'next',
      desc: '',
      args: [],
    );
  }

  /// `Error loading PDF`
  String get error_loading_PDF {
    return Intl.message(
      'Error loading PDF',
      name: 'error_loading_PDF',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get logout {
    return Intl.message(
      'Logout',
      name: 'logout',
      desc: '',
      args: [],
    );
  }

  /// `Invalid email or password or account is not activated`
  String get invalid_email_or_password {
    return Intl.message(
      'Invalid email or password or account is not activated',
      name: 'invalid_email_or_password',
      desc: '',
      args: [],
    );
  }

  /// `Please enter conform password`
  String get please_enter_conform_password {
    return Intl.message(
      'Please enter conform password',
      name: 'please_enter_conform_password',
      desc: '',
      args: [],
    );
  }

  /// `Email is already in use`
  String get email_is_already_in_use {
    return Intl.message(
      'Email is already in use',
      name: 'email_is_already_in_use',
      desc: '',
      args: [],
    );
  }

  /// `Registor successfull. Please check your email to activate your account`
  String get registor_success {
    return Intl.message(
      'Registor successfull. Please check your email to activate your account',
      name: 'registor_success',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'vi'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
