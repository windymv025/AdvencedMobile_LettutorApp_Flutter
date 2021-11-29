import 'package:english_lettutor_app/constants/assets.dart';
import 'package:english_lettutor_app/ui/screen/sign_up/components/sign_up_form.dart';
import 'package:english_lettutor_app/ui/widget/item_view/components/continue_with_component.dart';
import 'package:flutter/material.dart';

import 'already_have_account.dart';

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
              children: [
                SizedBox(
                    height: 150,
                    child: Image.asset(Assets.assetsImagesLargeLogo)),
                const SizedBox(
                  height: 25,
                ),
                const SignUpForm(),
                const SizedBox(
                  height: 15,
                ),
                const ContinueWithComponent(),
                const SizedBox(
                  height: 10,
                ),
                const AlreadyHaveAccount(),
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
