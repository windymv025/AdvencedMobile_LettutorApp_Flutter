import 'package:english_lettutor_app/constants/design/styles.dart';
import 'package:flutter/material.dart';

class TitleAndButton extends StatelessWidget {
  const TitleAndButton({
    Key? key,
    required this.title,
    required this.textButton,
    required this.onPressed,
  }) : super(key: key);
  final String title;
  final String textButton;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.fromLTRB(15, 10, 15, 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.bodyText1,
            ),
            const Spacer(),
            SizedBox(
              height: 30,
              child: ElevatedButton(
                  onPressed: onPressed,
                  child: Text(
                    textButton,
                    style: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w600),
                  ),
                  style: tagButtonStyleOn),
            )
          ],
        ));
  }
}
