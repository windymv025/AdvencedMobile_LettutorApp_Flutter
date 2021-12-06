import 'package:english_lettutor_app/constants/design/styles.dart';
import 'package:english_lettutor_app/models/course/course.dart';
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
          const TitleDetail(
            title: "Overview",
            textStyle: pageNameStyle,
          ),

          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Row(
              children: const [
                Icon(
                  Icons.help_rounded,
                  color: Colors.red,
                ),
                TitleDetail(title: "Why take this course?"),
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
              children: const [
                Icon(Icons.help_rounded, color: Colors.red),
                TitleDetail(title: "What will you be able to do?"),
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

          const TitleDetail(
            title: "Experience Level",
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

          const TitleDetail(
            title: "Course Length",
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

          const TitleDetail(
            title: "List Topics",
            textStyle: pageNameStyle,
          ),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: buildListTopics(course.topics!),
          ),

          const SizedBox(
            height: 30,
          )
        ],
      ),
    );
  }

  List<Widget> buildListTopics(List<String> topics) {
    List<Widget> result = [];
    for (var i = 0; i < topics.length; i++) {
      result.add(
        TitleDetail(title: "${i + 1} ${topics[i]}"),
      );
    }

    return result;
  }
}
