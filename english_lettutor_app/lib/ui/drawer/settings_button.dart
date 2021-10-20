import 'package:english_lettutor_app/utilities/constants/constants.dart';
import 'package:flutter/material.dart';

class SettingsButton extends StatelessWidget {
  const SettingsButton(
      {Key? key, this.onPress, required this.icon, required this.title})
      : super(key: key);
  final GestureTapCallback? onPress;
  final Widget icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    double defaultSize = 10;
    return InkWell(
      onTap: onPress,
      child: Container(
        color: kMainBlueColor.withOpacity(0.05),
        padding: EdgeInsets.symmetric(
            horizontal: defaultSize * 2, vertical: defaultSize * 1.5),
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
