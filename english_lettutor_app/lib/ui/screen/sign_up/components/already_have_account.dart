import 'package:english_lettutor_app/generated/l10n.dart';
import 'package:flutter/material.dart';

class AlreadyHaveAccount extends StatelessWidget {
  const AlreadyHaveAccount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          S.current.have_an_account,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
        ),
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Text(
            S.current.sign_in,
            style: const TextStyle(
                color: Color(0xff248EEF),
                fontSize: 14,
                fontWeight: FontWeight.w700),
          ),
        ),
      ],
    );
  }
}
