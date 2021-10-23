import 'package:english_lettutor_app/utilities/design/styles.dart';
import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({
    Key? key,
    this.text,
    this.press,
  }) : super(key: key);
  final String? text;
  final Function? press;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 45,
      child: ElevatedButton(
        onPressed: press as void Function()?,
        child: Text(text!, style: chipStyleOn),
        style: defaultButtonStyle,
      ),
    );
  }
}
