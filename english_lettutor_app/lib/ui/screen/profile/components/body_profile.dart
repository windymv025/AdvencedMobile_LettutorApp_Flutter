import 'package:english_lettutor_app/constants/assets.dart';
import 'package:english_lettutor_app/models/profile/profile.dart';
import 'package:english_lettutor_app/ui/screen/profile/components/infor_and_change_image.dart';
import 'package:english_lettutor_app/ui/screen/profile/components/profile_form.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';

class BodyProfile extends StatelessWidget {
  const BodyProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Profile profile = context.watch<Profile>();
    return ListView(children: [
      InforAndChangeImage(
        onTap: () {},
        image: _buildProfileImage(profile),
      ),
      const SizedBox(
        height: 25,
      ),
      const Padding(
        child: ProfileForm(),
        padding: EdgeInsets.symmetric(horizontal: 20),
      ),
    ]);
  }

  DecorationImage _buildProfileImage(Profile profile) {
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
      image: AssetImage((profile.image ?? Assets.assetsImagesUserIcon)),
    );
  }
}
