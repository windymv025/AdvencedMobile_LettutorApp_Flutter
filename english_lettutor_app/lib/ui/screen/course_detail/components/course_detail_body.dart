import 'package:english_lettutor_app/models/course.dart';
import 'package:english_lettutor_app/ui/screen/teacher_detail/components/title_detail.dart';
import 'package:english_lettutor_app/ui/widget/item_list/course_item.dart';
import 'package:english_lettutor_app/utilities/constants/styles.dart';
import 'package:flutter/material.dart';

class CourseDetailBody extends StatelessWidget {
  const CourseDetailBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Course course = Course.getDefault();

    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            child: CourseItem(
                image: Image.asset(course.image!),
                name: course.name!,
                subTitile: course.subtitle!,
                level: course.level!,
                lessons: course.lessons),
          ),
          //Overview
          const TitleDetail(
            title: "Overview",
            textStyle: pageNameStyle,
          ),

          Row(
            children: const [
              Icon(Icons.help_rounded),
              TitleDetail(title: "Why take this course?"),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
            child: Text(course.whyTakeCourse!,
                overflow: TextOverflow.clip,
                softWrap: true,
                textAlign: TextAlign.justify),
          ),

          Row(
            children: const [
              Icon(Icons.help_rounded),
              TitleDetail(title: "What will you be able to do?"),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
            child: Text(course.whatBeAbleToDo!,
                overflow: TextOverflow.clip,
                softWrap: true,
                textAlign: TextAlign.justify),
          ),

          const TitleDetail(
            title: "Experience Level",
            textStyle: pageNameStyle,
          ),
          Row(
            children: [
              const Icon(Icons.people_alt_rounded),
              Text(course.level!,
                  overflow: TextOverflow.clip,
                  softWrap: true,
                  textAlign: TextAlign.justify),
            ],
          ),

          const TitleDetail(
            title: "Course Length",
            textStyle: pageNameStyle,
          ),
          Row(
            children: [
              const Icon(Icons.book_rounded),
              Text(course.lessons.toString(),
                  overflow: TextOverflow.clip,
                  softWrap: true,
                  textAlign: TextAlign.justify),
            ],
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
