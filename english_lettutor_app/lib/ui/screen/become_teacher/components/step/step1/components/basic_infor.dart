import 'dart:io';

import 'package:english_lettutor_app/constants/constants.dart';
import 'package:english_lettutor_app/constants/design/styles.dart';
import 'package:english_lettutor_app/models/teacher/teacher.dart';
import 'package:english_lettutor_app/ui/widget/item_view/components/custom_suffix_icon.dart';
import 'package:english_lettutor_app/ui/widget/item_view/edit_field/pick_country_field.dart';
import 'package:english_lettutor_app/ui/widget/item_view/edit_field/pick_date_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class BasicInfor extends StatefulWidget {
  const BasicInfor({Key? key}) : super(key: key);

  @override
  _BasicInforState createState() => _BasicInforState();
}

class _BasicInforState extends State<BasicInfor> {
  File? _image;
  final TextEditingController _fullnameControlor = TextEditingController();
  final TextEditingController _birthday = TextEditingController();
  final TextEditingController _country = TextEditingController();

  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;

      final imageTemp = File(image.path);
      setState(() {
        _image = imageTemp;
      });
    } on PlatformException catch (e) {
      // ignore: avoid_print
      print('Failed to pick image: ${e.message}');
    }
  }

  @override
  Widget build(BuildContext context) {
    Teacher teacher = Provider.of<Teacher>(context);

    _fullnameControlor.text = teacher.name!;
    _country.text = teacher.country;
    _birthday.text = teacher.birthday != null
        ? DateFormat('dd/MM/yyyy').format(teacher.birthday!)
        : '';
    return Column(
      children: [
        //Basic info
        Row(
          children: const [
            Text("Basic info", style: titleBlueStyle),
            Spacer(),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                pickImage();
                if (_image != null) {
                  teacher.uriImage = _image!.path;
                }
              },
              child: Container(
                margin: const EdgeInsets.all(10),
                width: 150,
                height: 150,
                child: _image != null
                    ? Image.file(
                        _image!,
                        fit: BoxFit.cover,
                      )
                    : const Icon(
                        Icons.camera_alt,
                        size: 40,
                      ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.blueGrey.withOpacity(0.5),
                ),
              ),
            ),
            const Expanded(
              child: SizedBox(
                width: 100,
                child: Text(
                  "Please upload your professional photo.\nSee guidelines",
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.clip,
                  softWrap: true,
                  style: TextStyle(color: kPrimaryColor),
                ),
              ),
            ),
          ],
        ),

        const SizedBox(height: 10),
        //Full name
        Container(
          constraints: const BoxConstraints(maxWidth: 500),
          child: TextFormField(
            keyboardType: TextInputType.name,
            controller: _fullnameControlor,
            onChanged: (value) {
              teacher.name = value;
            },
            decoration: const InputDecoration(
              label: Text("Full name"),
              hintText: "Enter your name",
              floatingLabelBehavior: FloatingLabelBehavior.always,
              suffixIcon: CustomSurffixIcon(icon: Icons.person_outline_rounded),
            ),
          ),
        ),

        //Birthday
        const SizedBox(
          height: 15,
        ),
        PickDateField(
          controller: _birthday,
          icon: Icons.date_range_outlined,
          label: "Birthday",
          hint: "Select your birthday",
          onChanged: (value) {
            teacher.birthday = DateTime.parse(value);
          },
        ),

        //Country
        const SizedBox(
          height: 15,
        ),
        PickCountryField(
          controller: _country,
          onChanged: (value) {
            teacher.country = value;
          },
        ),
        const SizedBox(
          height: 15,
        ),
      ],
    );
  }
}
