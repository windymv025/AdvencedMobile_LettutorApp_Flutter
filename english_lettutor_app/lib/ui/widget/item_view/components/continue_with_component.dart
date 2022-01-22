import 'package:english_lettutor_app/constants/assets.dart';
import 'package:english_lettutor_app/data/provider/course_dto.dart';
import 'package:english_lettutor_app/data/provider/profile_provider.dart';
import 'package:english_lettutor_app/data/provider/schedule_dto.dart';
import 'package:english_lettutor_app/data/provider/schedule_history_dto.dart';
import 'package:english_lettutor_app/data/provider/teacher_dto.dart';
import 'package:english_lettutor_app/generated/l10n.dart';
import 'package:english_lettutor_app/ui/screen/home/home_screen.dart';
import 'package:english_lettutor_app/ui/widget/item_view/components/socal_card.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class ContinueWithComponent extends StatefulWidget {
  const ContinueWithComponent({Key? key}) : super(key: key);

  @override
  _ContinueWithComponentState createState() => _ContinueWithComponentState();
}

class _ContinueWithComponentState extends State<ContinueWithComponent> {
  void initData() {
    Provider.of<ScheduleDTO>(context, listen: false).init();
    Provider.of<TeacherDTO>(context, listen: false).init();
    Provider.of<ScheduleHistoryDTO>(context, listen: false).init();
    Provider.of<CourseDTO>(context, listen: false).init();
    //init data
  }

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
                    initData();
                  } else {
                    Fluttertoast.showToast(
                        msg: S.current.login_failed,
                        toastLength: Toast.LENGTH_LONG,
                        timeInSecForIosWeb: 2);
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
                    initData();
                  } else {
                    Fluttertoast.showToast(
                        msg: S.current.login_failed,
                        toastLength: Toast.LENGTH_LONG,
                        timeInSecForIosWeb: 2);
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
