import 'package:english_lettutor_app/ui/widget/item_list/your_teacher_item.dart';
import 'package:english_lettutor_app/utilities/constants/assets.dart';
import 'package:flutter/material.dart';

class ListYourTeacher extends StatefulWidget {
  const ListYourTeacher({Key? key}) : super(key: key);

  @override
  _ListYourTeacherState createState() => _ListYourTeacherState();
}

class _ListYourTeacherState extends State<ListYourTeacher> {
  static final List<Widget> teachers = [
    YourTeacherItem(
        image: Image.asset(Assets.assetsImagesUserIcon),
        name: "Phạm Minh",
        ratings: 4.5,
        tags: const ["English", "TOIEC", "IEAL", "ABC"]),
    YourTeacherItem(
        image: Image.asset(Assets.assetsImagesNoDataFound),
        name: "Phạm Minh Vương",
        ratings: 5,
        tags: const ["English", "TOIEC"]),
    YourTeacherItem(
        image: Image.asset(Assets.assetsImagesImageLogo),
        name: "Minh Vương",
        ratings: 30,
        tags: const ["English", "TOIEC"]),
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: teachers,
      ),
    );
  }
}
