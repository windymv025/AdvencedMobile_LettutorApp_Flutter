import 'package:english_lettutor_app/models/teacher.dart';
import 'package:english_lettutor_app/ui/screen/home/components/custom_grid_view.dart';
import 'package:english_lettutor_app/ui/screen/home/components/search_bar_title.dart';
import 'package:english_lettutor_app/ui/widget/item_view/tag/tag.dart';
import 'package:english_lettutor_app/utilities/constants/assets.dart';
import 'package:english_lettutor_app/utilities/constants/styles.dart';
import 'package:flutter/material.dart';

class TeacherPage extends StatefulWidget {
  const TeacherPage({Key? key}) : super(key: key);

  @override
  TeacherPageState createState() => TeacherPageState();
}

class TeacherPageState extends State<TeacherPage> {
  final List<Teacher> teachers = [];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    loadListTeacher();
    return CustomScrollView(
      slivers: [
        SliverList(
            delegate: SliverChildListDelegate([
          SearchBarTitle(
            size: size,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 10, top: 10),
            child: Text(
              "Find a teacher",
              style: titleStyle,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
            child: Wrap(
              spacing: 5,
              children: const [
                Tag(
                  label: "All",
                  canPress: true,
                  focus: true,
                ),
                Tag(
                  label: "English for kids",
                  canPress: true,
                ),
                Tag(
                  label: "Conversational",
                  canPress: true,
                ),
                Tag(
                  label: "STARTERS",
                  canPress: true,
                ),
                Tag(
                  label: "MOVERS",
                  canPress: true,
                ),
                Tag(
                  label: "FLYERS",
                  canPress: true,
                ),
                Tag(
                  label: "KET",
                  canPress: true,
                ),
                Tag(
                  label: "PET",
                  canPress: true,
                ),
                Tag(
                  label: "IELTS",
                  canPress: true,
                ),
                Tag(
                  label: "TOEFL",
                  canPress: true,
                ),
                Tag(
                  label: "TOEIC",
                  canPress: true,
                ),
              ],
            ),
          )
        ])),
        CustomGridView(size: size, items: teachers),
      ],
    );
  }

  loadListTeacher() {
    //todo
    teachers.add(
      Teacher(
          id: 0,
          name: "Pham Minh Vuong",
          uriImage: Assets.assetsImagesNoDataFound,
          specialties: ["English", "TOEIC"],
          description:
              """Hi, I am teacher Nhi. I have been teaching English for 2 years. I used to study abroad in Sydney for 7 years. During my time as an overseas student, I had spoken with many people from diverse cultural backgrounds; therefore, I have strong listening and speaking skills. I love teaching English and I will devote to helping you improve your English skills if you book my class. I am also patient and understanding because I know for many people, English is a tough language to master. In my class, I will help you correct your pronunciation and deliver the lessons in a way that is easy for you to understand. If you book my class, you will have many chances to practice your speaking skills and also improve your pronunciation and grammatical knowledge. Besides that, if you need me to, I will share my personal tips to study English more effectively with you and show you the importance of having fun and practice while learning English. As an English teacher, I constantly update my English knowledge to better serve my career and students.""",
          ratings: 4.5),
    );
    teachers.add(
      Teacher(
          id: 1,
          name: "Windy Pham",
          uriImage: Assets.assetsImagesCloudData,
          specialties: ["English"],
          description: "I'm a teacher.",
          ratings: 3.0),
    );
    teachers.add(
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

    teachers.add(
      Teacher(
          id: 3,
          name: "Michelle Roque",
          uriImage: Assets.assetsImagesUserIcon,
          specialties: ["English", "TOEIC", "English for kids"],
          description:
              "I was born in Chester, United Kingdom, but now live in Manila, Philippines. I am a person of varied interests, I love baking, reading, photography and languages. I enjoy teaching English to all ages and levels as I believe it opens the door to global opportunities. I am a fun, talkative person who loves to find out about others cultures and experience.",
          ratings: 5),
    );

    teachers.add(
      Teacher(
          id: 3,
          name: "Michelle Roque",
          uriImage: Assets.assetsImagesLargeLogo,
          specialties: ["English", "TOEIC", "English for kids"],
          description:
              "I was born in Chester, United Kingdom, but now live in Manila, Philippines. I am a person of varied interests, I love baking, reading, photography and languages. I enjoy teaching English to all ages and levels as I believe it opens the door to global opportunities. I am a fun, talkative person who loves to find out about others cultures and experience.",
          ratings: 5),
    );

    teachers.add(
      Teacher(
          id: 3,
          name: "Michelle Roque",
          uriImage: Assets.assetsImagesLargeLogo,
          specialties: ["English", "TOEIC", "English for kids"],
          description:
              "I was born in Chester, United Kingdom, but now live in Manila, Philippines. I am a person of varied interests, I love baking, reading, photography and languages. I enjoy teaching English to all ages and levels as I believe it opens the door to global opportunities. I am a fun, talkative person who loves to find out about others cultures and experience.",
          ratings: 2),
    );
  }
}
