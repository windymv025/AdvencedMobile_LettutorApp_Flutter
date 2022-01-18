import 'package:english_lettutor_app/constants/assets.dart';
import 'package:english_lettutor_app/data/provider/profile_provider.dart';
import 'package:english_lettutor_app/generated/l10n.dart';
import 'package:english_lettutor_app/ui/screen/home/home_screen.dart';
import 'package:english_lettutor_app/ui/widget/item_view/components/socal_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ContinueWithComponent extends StatelessWidget {
  const ContinueWithComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProfileProvider profileProvider =
        Provider.of<ProfileProvider>(context, listen: false);
    return Column(
      children: [
        Center(
          child: Text(
            S.current.continue_with,
            style: const TextStyle(fontWeight: FontWeight.w600),
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
              press: () {
                profileProvider.signInWithGoogle().then((value) {
                  if (value) {
                    Navigator.pushReplacementNamed(
                      context,
                      HomeScreen.routeName,
                    );
                  }
                });
              },
            ),
            SocalCard(
              icon: Assets.assetsIconsFacebook2,
              press: () {
                profileProvider.signInWithFacebook().then((value) {
                  if (value) {
                    Navigator.pushReplacementNamed(
                      context,
                      HomeScreen.routeName,
                    );
                  }
                });
              },
            ),
          ],
        )
      ],
    );
  }
}
