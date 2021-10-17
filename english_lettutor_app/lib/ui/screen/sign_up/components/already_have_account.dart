import 'package:flutter/material.dart';

class AlreadyHaveAccount extends StatelessWidget {
  const AlreadyHaveAccount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Already have an account? ",
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
        ),
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Text(
            "Sign In",
            style: TextStyle(
                color: Color(0xff248EEF),
                fontSize: 14,
                fontWeight: FontWeight.w700),
          ),
        ),
      ],
    );
  }
}
