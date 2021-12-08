import 'package:english_lettutor_app/constants/assets.dart';
import 'package:english_lettutor_app/generated/l10n.dart';
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
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 30, right: 30),
                  child: Text(
                    S.current.check_email_str,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 13),
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
