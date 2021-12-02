import 'package:english_lettutor_app/ui/screen/otp_screen/components/otp_body.dart';
import 'package:flutter/material.dart';

class OTPScreen extends StatefulWidget {
  static const routeName = '/otp_screen';
  const OTPScreen({Key? key}) : super(key: key);

  @override
  _OTPScreenState createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  @override
  Widget build(BuildContext context) {
    final _routeName = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        title: const Text("OTP"),
      ),
      body: OTPBody(routeName: _routeName),
    );
  }
}
