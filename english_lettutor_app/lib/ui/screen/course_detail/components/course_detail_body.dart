import 'package:english_lettutor_app/constants/design/styles.dart';
import 'package:english_lettutor_app/generated/l10n.dart';
import 'package:english_lettutor_app/models/course/course-models.dart';
import 'package:english_lettutor_app/models/course/course.dart';
import 'package:english_lettutor_app/ui/pdf_viewer/pdf_viewer_screen.dart';
import 'package:english_lettutor_app/ui/screen/teacher_detail/components/title_detail.dart';
import 'package:english_lettutor_app/ui/widget/item_list/course_item.dart';
import 'package:flutter/material.dart';

class CourseDetailBody extends StatelessWidget {
  const CourseDetailBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Course course = ModalRoute.of(context)!.settings.arguments as Course;

    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            child: CourseItem(
              course: course,
            ),
          ),
          //Overview
          TitleDetail(
            title: S.current.overview,
            textStyle: pageNameStyle,
          ),

          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Row(
              children: [
                const Icon(
                  Icons.help_rounded,
                  color: Colors.red,
                ),
                TitleDetail(title: S.current.why_take_this_course),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
            child: Text(course.whyTakeCourse ?? "",
                overflow: TextOverflow.clip,
                softWrap: true,
                textAlign: TextAlign.justify),
          ),

          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Row(
              children: [
                const Icon(Icons.help_rounded, color: Colors.red),
                TitleDetail(title: S.current.what_be_able_to_do),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
            child: Text(course.whatBeAbleToDo ?? "",
                overflow: TextOverflow.clip,
                softWrap: true,
                textAlign: TextAlign.justify),
          ),

          TitleDetail(
            title: S.current.experience_level,
            textStyle: pageNameStyle,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Row(
              children: [
                const Icon(Icons.people_alt_rounded, color: Colors.deepOrange),
                const SizedBox(
                  width: 5,
                ),
                Text(course.level!,
                    style: titleStyle,
                    overflow: TextOverflow.clip,
                    softWrap: true,
                    textAlign: TextAlign.justify),
              ],
            ),
          ),

          TitleDetail(
            title: S.current.course_length,
            textStyle: pageNameStyle,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Row(
              children: [
                const Icon(Icons.book_rounded, color: Colors.deepOrange),
                const SizedBox(
                  width: 5,
                ),
                Text(course.lessons.toString(),
                    style: titleStyle,
                    overflow: TextOverflow.clip,
                    softWrap: true,
                    textAlign: TextAlign.justify),
              ],
            ),
          ),

          TitleDetail(
            title: S.current.list_topics,
            textStyle: pageNameStyle,
          ),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: buildListTopics(context, course.topics!),
          ),

          const SizedBox(
            height: 30,
          )
        ],
      ),
    );
  }

  List<Widget> buildListTopics(BuildContext context, List<Topic> topics) {
    List<Widget> result = [];
    for (var i = 0; i < topics.length; i++) {
      result.add(
        InkWell(
            onTap: () {
              Navigator.pushNamed(context, PDFViewScreen.routeName,
                  arguments: topics[i].nameFile);
            },
            child: TitleDetail(title: "${i + 1} ${topics[i].name}")),
      );
    }

    return result;
  }
}
