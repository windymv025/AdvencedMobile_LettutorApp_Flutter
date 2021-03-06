import 'package:english_lettutor_app/constants/assets.dart';
import 'package:english_lettutor_app/generated/l10n.dart';
import 'package:english_lettutor_app/ui/widget/item_view/components/continue_with_component.dart';
import 'package:flutter/material.dart';

import 'reset_password_form.dart';

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
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 30, right: 30),
                  child: Text(
                    S.current.enter_new_password,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 13),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                const ResetPasswordForm(),
                const SizedBox(
                  height: 15,
                ),
                const ContinueWithComponent(),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
