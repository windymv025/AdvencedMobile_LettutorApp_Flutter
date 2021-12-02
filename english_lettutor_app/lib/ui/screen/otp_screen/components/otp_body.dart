import 'package:english_lettutor_app/constants/assets.dart';
import 'package:flutter/material.dart';

import 'otp_form.dart';

class OTPBody extends StatefulWidget {
  const OTPBody({Key? key, required this.routeName}) : super(key: key);
  final String routeName;

  @override
  _OTPBodyState createState() => _OTPBodyState();
}

class _OTPBodyState extends State<OTPBody> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                    height: 150,
                    child: Image.asset(Assets.assetsImagesLargeLogo)),
                const Padding(
                  padding: EdgeInsets.only(top: 10, left: 30, right: 30),
                  child: Text(
                    "Check your email then enter the OTP code below",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 13),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                OTPForm(
                  routeName: widget.routeName,
                ),
                const SizedBox(
                  height: 15,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
