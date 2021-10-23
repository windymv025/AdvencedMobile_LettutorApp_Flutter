import 'package:english_lettutor_app/ui/widget/item_view/components/socal_card.dart';
import 'package:english_lettutor_app/utilities/constants/assets.dart';
import 'package:flutter/material.dart';

class ContinueWithComponent extends StatelessWidget {
  const ContinueWithComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Center(
          child: Text(
            "Or continue with",
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SocalCard(
              icon: Assets.assetsIconsGoogleIcon,
              press: () {},
            ),
            SocalCard(
              icon: Assets.assetsIconsFacebook2,
              press: () {},
            ),
          ],
        )
      ],
    );
  }
}
