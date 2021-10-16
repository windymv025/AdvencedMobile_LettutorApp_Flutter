import 'package:flutter/material.dart';

import 'components/body.dart';

class ResetPasswordScreen extends StatelessWidget {
  static String routename = "/reset_password_screen";
  const ResetPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Reset Password"),
      ),
      body: const Body(),
    );
  }
}
