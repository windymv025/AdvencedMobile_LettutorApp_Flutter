import 'package:english_lettutor_app/constants/assets.dart';
import 'package:english_lettutor_app/data/sharedpref/shared_preference_helper.dart';
import 'package:english_lettutor_app/generated/l10n.dart';
import 'package:english_lettutor_app/ui/screen/sign_in/sign_in_screen.dart';
import 'package:english_lettutor_app/ui/widget/item_view/button/default_button.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  static String routeName = "/splash_screen";
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(Assets.assetsImagesLargeLogo),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: SizedBox(
              width: 200,
              child: DefaultButton(
                press: () {
                  Navigator.pushNamed(context, SignInScreen.routeName);
                },
                text: S.of(context).let_start,
              ),
            ),
          )
        ],
      )),
    );
  }
}
