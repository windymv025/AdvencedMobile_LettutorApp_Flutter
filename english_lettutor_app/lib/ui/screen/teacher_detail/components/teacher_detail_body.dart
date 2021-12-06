import 'package:english_lettutor_app/models/teacher/teacher.dart';
import 'package:english_lettutor_app/ui/screen/teacher_detail/components/action/teacher_detail_action.dart';
import 'package:english_lettutor_app/ui/screen/teacher_detail/components/simple_infor_teaacher.dart';
import 'package:english_lettutor_app/ui/screen/teacher_detail/components/rating_and_comment.dart';
import 'package:english_lettutor_app/ui/screen/teacher_detail/components/title_and_tags.dart';
import 'package:english_lettutor_app/ui/screen/teacher_detail/components/title_detail.dart';
import 'package:english_lettutor_app/ui/widget/item_view/media/video_network_widget.dart';
import 'package:flutter/material.dart';

class TeacherDetailBody extends StatefulWidget {
  const TeacherDetailBody({Key? key, required this.teacher}) : super(key: key);
  final Teacher teacher;

  @override
  _TeacherDetailBodyState createState() => _TeacherDetailBodyState();
}

class _TeacherDetailBodyState extends State<TeacherDetailBody> {
  @override
  Widget build(BuildContext context) {
    Teacher teacher = widget.teacher;

    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //Video
          // VideoIntroduce(uri: teacher.uriVideo!),
          VideoNetworkWidget(teacher.uriVideo),
          // image and simple infor teacher
          SimpleInforTeacher(teacher: teacher),
          //Booking, message, report
          TeacherDetailAction(
            teacher: teacher,
          ),

          //Languages
          TitleAndTags(tags: teacher.languages, title: "Languages"),

          //Education
          const TitleDetail(title: "Education"),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
            child: Text(teacher.education ?? "",
                overflow: TextOverflow.clip,
                softWrap: true,
                textAlign: TextAlign.justify),
          ),

          //Experience
          const TitleDetail(title: "Experience"),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
            child: Text(
              teacher.experience ?? "",
              overflow: TextOverflow.clip,
              textAlign: TextAlign.justify,
            ),
          ),

          //Interests
          const TitleDetail(title: "Interests"),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
            child: Text(teacher.interests ?? "",
                overflow: TextOverflow.clip,
                softWrap: true,
                textAlign: TextAlign.justify),
          ),

          //Profession
          const TitleDetail(title: "Profession"),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
            child: Text(teacher.profession ?? "",
                overflow: TextOverflow.clip,
                softWrap: true,
                textAlign: TextAlign.justify),
          ),

          //Specialties
          TitleAndTags(tags: teacher.specialties!, title: "Specialties"),

          //Rating and Comment
          RatingAndComment(teacher: teacher),
        ],
      ),
    );
  }
}
