import 'package:english_lettutor_app/constants/constants.dart';
import 'package:flutter/material.dart';

class SettingsButton extends StatelessWidget {
  const SettingsButton(
      {Key? key,
      this.onPress,
      required this.icon,
      required this.title,
      this.child})
      : super(key: key);
  final GestureTapCallback? onPress;
  final Widget icon;
  final String title;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    double defaultSize = 10;
    return InkWell(
      onTap: onPress,
      child: Container(
        color: kMainBlueColor.withOpacity(0.05),
        padding: EdgeInsets.fromLTRB(
            defaultSize * 2, 0, defaultSize * 2, defaultSize),
        child: SafeArea(
          child: Row(
            children: <Widget>[
              icon,
              SizedBox(width: defaultSize * 2),
              Text(
                title,
                style: const TextStyle(fontSize: 14),
              ),
              const Spacer(),
              child ?? Container(),
              const SizedBox(width: 5),
              Icon(
                Icons.arrow_forward_ios,
                size: defaultSize * 1.6,
                color: kMainBlueColor,
              )
            ],
          ),
        ),
      ),
    );
  }
}
