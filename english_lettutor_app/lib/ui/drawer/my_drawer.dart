import 'package:english_lettutor_app/constants/assets.dart';
import 'package:english_lettutor_app/constants/constants.dart';
import 'package:english_lettutor_app/data/provider/profile_provider.dart';
import 'package:english_lettutor_app/data/provider/teacher_dto.dart';
import 'package:english_lettutor_app/generated/l10n.dart';
import 'package:english_lettutor_app/ui/screen/become_teacher/become_teacher_screen.dart';
import 'package:english_lettutor_app/ui/screen/favorite_teacher/favorite_teacher.dart';
import 'package:english_lettutor_app/ui/screen/history/schedule_history_screen.dart';
import 'package:english_lettutor_app/ui/screen/profile/components/infor.dart';
import 'package:english_lettutor_app/ui/screen/profile/profile_screen.dart';
import 'package:english_lettutor_app/ui/screen/setting/setting_screen.dart';
import 'package:english_lettutor_app/ui/screen/sign_in/sign_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import 'components/settings_button.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return Container();
    TeacherDTO teacherDTO = Provider.of<TeacherDTO>(context);
    ProfileProvider profile = Provider.of<ProfileProvider>(context);

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            color: kMainBlueColor,
            height: 5,
          ),
          Infor(
            image: _buildProfileImage(profile),
            onTap: () =>
                Navigator.popAndPushNamed(context, ProfileScreen.routeName),
            defaultSize: 10,
          ),
          const SizedBox(
            height: 25,
          ),
          SettingsButton(
              onPress: () {
                Navigator.popAndPushNamed(
                    context, ScheduleHistoryScreen.routeName);
              },
              icon: const Icon(
                Icons.history_edu_rounded,
                color: kMainBlueColor,
              ),
              title: S.current.schedule_history),
          SettingsButton(
              onPress: () {
                teacherDTO.clearSpecialities();
                Navigator.popAndPushNamed(context, FavoriteTeacher.routeName);
              },
              icon: const Icon(
                Icons.favorite_rounded,
                color: kMainBlueColor,
              ),
              title: S.current.favorite_teachers),
          SettingsButton(
              onPress: () {
                Navigator.popAndPushNamed(
                    context, BecomeTeacherScreen.routeName);
              },
              icon: SvgPicture.asset(
                Assets.assetsIconsTeacher,
                color: kMainBlueColor,
                height: 24,
                width: 18,
              ),
              title: S.current.become_teacher),
          SettingsButton(
              onPress: () {
                Navigator.popAndPushNamed(context, SettingScreen.routeName);
              },
              icon: const Icon(
                Icons.settings_rounded,
                color: kMainBlueColor,
              ),
              title: S.current.setting),
          SettingsButton(
              onPress: () {
                Navigator.pushReplacementNamed(context, SignInScreen.routeName);
              },
              icon: const Icon(
                Icons.logout_rounded,
                color: kMainBlueColor,
              ),
              title: S.current.logout),
          const SizedBox(
            height: 25,
          ),
        ],
      ),
    );
  }

  DecorationImage _buildProfileImage(ProfileProvider profile) {
    try {
      if (profile.imageFile != null) {
        return DecorationImage(
          fit: BoxFit.cover,
          colorFilter: const ColorFilter.mode(
            Colors.white,
            BlendMode.dstATop,
          ),
          image: FileImage(profile.imageFile!),
        );
      }
      return DecorationImage(
        fit: BoxFit.cover,
        colorFilter: const ColorFilter.mode(
          Colors.white,
          BlendMode.dstATop,
        ),
        image: NetworkImage((profile.image ?? Assets.assetsImagesUserIcon)),
      );
    } catch (e) {
      return const DecorationImage(
        fit: BoxFit.cover,
        colorFilter: ColorFilter.mode(
          Colors.white,
          BlendMode.dstATop,
        ),
        image: AssetImage(Assets.assetsImagesUserIcon),
      );
    }
  }
}
