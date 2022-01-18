import 'dart:io';

import 'package:english_lettutor_app/constants/assets.dart';
import 'package:english_lettutor_app/data/provider/profile_provider.dart';
import 'package:english_lettutor_app/ui/screen/profile/components/infor_and_change_image.dart';
import 'package:english_lettutor_app/ui/screen/profile/components/profile_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/src/provider.dart';

class BodyProfile extends StatefulWidget {
  const BodyProfile({Key? key}) : super(key: key);

  @override
  _BodyProfileState createState() => _BodyProfileState();
}

class _BodyProfileState extends State<BodyProfile> {
  File? _image;
  late ProfileProvider profile;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    profile = context.watch<ProfileProvider>();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      InforAndChangeImage(
        onTap: pickImage,
        image: _buildProfileImage(profile),
      ),
      const SizedBox(
        height: 25,
      ),
      Padding(
        child: ProfileForm(
          onSubmit: () {
            profile.updateProfile();
          },
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20),
      ),
    ]);
  }

  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;

      final imageTemp = File(image.path);
      setState(() {
        _image = imageTemp;
        profile.imageFile = _image;
      });
    } on PlatformException catch (e) {
      // ignore: avoid_print
      print('Failed to pick image: ${e.message}');
    }
  }

  DecorationImage _buildProfileImage(ProfileProvider profile) {
    if (_image != null) {
      return DecorationImage(
        fit: BoxFit.cover,
        colorFilter: const ColorFilter.mode(
          Colors.white,
          BlendMode.dstATop,
        ),
        image: FileImage(_image!),
      );
    }
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
  }
}
