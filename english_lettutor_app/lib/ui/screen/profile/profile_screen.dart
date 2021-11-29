import 'package:english_lettutor_app/constants/constants.dart';
import 'package:flutter/material.dart';

import 'components/body_profile.dart';

class ProfileScreen extends StatefulWidget {
  static String routeName = "/profile_screen";
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kMainBlueColor,
      ),
      body: const BodyProfile(),
    );
  }
}
