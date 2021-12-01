import 'package:english_lettutor_app/constants/design/styles.dart';
import 'package:english_lettutor_app/data/provider/teacher_dto.dart';
import 'package:english_lettutor_app/ui/screen/home/home_page/components/custom_grid_view.dart';
import 'package:english_lettutor_app/ui/widget/item_view/bar/search_bar_title.dart';
import 'package:english_lettutor_app/ui/widget/item_view/components/tag.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TeacherPage extends StatefulWidget {
  const TeacherPage({Key? key}) : super(key: key);

  @override
  TeacherPageState createState() => TeacherPageState();
}

class TeacherPageState extends State<TeacherPage> {
  late TeacherDTO teacherDTO;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    teacherDTO = Provider.of<TeacherDTO>(context, listen: true);
  }

  void reload() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
        CustomGridView(
            size: size, items: teacherDTO.getTeachersByspecialities()),
      ],
    );
  }
}
