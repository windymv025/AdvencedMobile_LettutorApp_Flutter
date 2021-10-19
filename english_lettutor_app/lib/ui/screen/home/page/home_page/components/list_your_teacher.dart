import 'package:english_lettutor_app/models/teacher.dart';
import 'package:english_lettutor_app/ui/widget/item_list/your_teacher_item.dart';
import 'package:english_lettutor_app/utilities/constants/assets.dart';
import 'package:flutter/material.dart';

class ListYourTeacher extends StatefulWidget {
  const ListYourTeacher({Key? key}) : super(key: key);

  @override
  _ListYourTeacherState createState() => _ListYourTeacherState();
}

class _ListYourTeacherState extends State<ListYourTeacher> {
  List<Teacher> listTeachers = [];

  final List<Widget> teachers = [
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
      physics: const ScrollPhysics(),
      primary: false,
      child: Row(children: teachers),
    );
  }

  Widget buildItemTeacher(Teacher teacher) {
    return YourTeacherItem(
        image: Image.asset(teacher.uriImage!),
        name: teacher.name,
        ratings: teacher.ratings,
        tags: teacher.specialties);
  }

  List<Widget> buildListTeacher() {
    loadListTeacher();
    List<Widget> listItems = [];
    for (var item in listTeachers) {
      listItems.add(buildItemTeacher(item));
    }
    return listItems;
  }

  loadListTeacher() {
    listTeachers.add(
      Teacher(
          id: 0,
          name: "Pham Minh Vuong",
          uriImage: Assets.assetsImagesNoDataFound,
          specialties: ["English", "TOEIC"],
          description: "I'm a teacher.",
          ratings: 4.5),
    );
    listTeachers.add(
      Teacher(
          id: 1,
          name: "Windy Pham",
          uriImage: Assets.assetsImagesCloudData,
          specialties: ["English"],
          description: "I'm a teacher.",
          ratings: 3.0),
    );
    listTeachers.add(
      Teacher(
          id: 2,
          name: "nhi lam",
          uriImage: Assets.assetsImagesUserIcon,
          specialties: [
            "English for kids",
            "Conversational",
            "English for Business"
          ],
          description:
              """Hi, I am teacher Nhi. I have been teaching English for 2 years. I used to study abroad in Sydney for 7 years. During my time as an overseas student, I had spoken with many people from diverse cultural backgrounds; therefore, I have strong listening and speaking skills. I love teaching English and I will devote to helping you improve your English skills if you book my class. I am also patient and understanding because I know for many people, English is a tough language to master. In my class, I will help you correct your pronunciation and deliver the lessons in a way that is easy for you to understand. If you book my class, you will have many chances to practice your speaking skills and also improve your pronunciation and grammatical knowledge. Besides that, if you need me to, I will share my personal tips to study English more effectively with you and show you the importance of having fun and practice while learning English. As an English teacher, I constantly update my English knowledge to better serve my career and students.""",
          ratings: 3.5),
    );

    listTeachers.add(
      Teacher(
          id: 3,
          name: "Michelle Roque",
          specialties: ["English", "TOEIC", "English for kids"],
          description:
              "I was born in Chester, United Kingdom, but now live in Manila, Philippines. I am a person of varied interests, I love baking, reading, photography and languages. I enjoy teaching English to all ages and levels as I believe it opens the door to global opportunities. I am a fun, talkative person who loves to find out about others cultures and experience.",
          ratings: 5),
    );
  }
}
