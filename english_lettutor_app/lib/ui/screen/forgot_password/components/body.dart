import 'package:english_lettutor_app/constants/assets.dart';
import 'package:english_lettutor_app/ui/screen/sign_in/components/no_account_text.dart';
import 'package:english_lettutor_app/ui/widget/item_view/components/continue_with_component.dart';
import 'package:flutter/material.dart';

import 'forgot_password_form.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

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
                    "Enter your email address and we’ll send you a link to reset your password",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 13),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                const ForgotPasswordForm(),
                const SizedBox(
                  height: 15,
                ),
                const ContinueWithComponent(),
                const SizedBox(
                  height: 10,
                ),
                const NoAccountText(),
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
