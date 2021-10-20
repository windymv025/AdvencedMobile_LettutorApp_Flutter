import 'package:english_lettutor_app/models/rating_comment.dart';
import 'package:english_lettutor_app/models/teacher.dart';
import 'package:english_lettutor_app/ui/screen/teacher_detail/components/title_detail.dart';
import 'package:english_lettutor_app/ui/widget/item_list/my_list_tile.dart';
import 'package:english_lettutor_app/ui/widget/item_view/button/default_button.dart';
import 'package:english_lettutor_app/ui/widget/item_view/rating.dart';
import 'package:english_lettutor_app/ui/widget/item_view/tag/tag.dart';
import 'package:english_lettutor_app/utilities/constants/constants.dart';
import 'package:english_lettutor_app/utilities/constants/styles.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TeacherDetailBody extends StatefulWidget {
  const TeacherDetailBody({Key? key}) : super(key: key);

  @override
  _TeacherDetailBodyState createState() => _TeacherDetailBodyState();
}

class _TeacherDetailBodyState extends State<TeacherDetailBody> {
  static final List<Icon> _listIcons = [
    const Icon(Icons.favorite_border_rounded, color: Colors.red),
    const Icon(Icons.favorite_rounded, color: Colors.red)
  ];

  var _icon = _listIcons[0];

  void onFavoriteClick() {
    setState(() {
      _icon = _icon == _listIcons[0] ? _listIcons[1] : _listIcons[0];
    });
  }

  Teacher teacher = Teacher.getDefault();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //Video
          Container(
            height: 150,
            color: Colors.grey,
            child: Row(
              children: [
                const Spacer(),
                Text(teacher.uriVideo!),
                const Spacer()
              ],
            ),
          ),
          // image and simple infor teacher
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: MyListTile(
                avatar: AssetImage(teacher.uriImage!),
                title: Text(
                  teacher.name!,
                  style: titleStyle,
                ),
                subtitle: Rating(
                  rating: teacher.ratings!,
                  onRatingUpdate: () {},
                ),
                trailing: IconButton(
                  icon: _icon,
                  onPressed: onFavoriteClick,
                  iconSize: 30,
                ),
                onTap: null,
                color: Colors.white),
          ),
          //Booking, message, report
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: DefaultButton(
              text: "Booking",
              press: () {},
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.message_rounded,
                    color: kMainBlueColor,
                    size: 35,
                  )),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.report_rounded,
                      color: kMainBlueColor, size: 35)),
            ],
          ),

          const SizedBox(
            height: 10,
          ),

          //Languages
          const TitleDetail(title: "Languages"),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
              child: Wrap(
                children: buildTagsFromList(teacher.languages!),
              )),

          //Education
          const TitleDetail(title: "Education"),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
            child: Text(teacher.education!,
                overflow: TextOverflow.clip,
                softWrap: true,
                textAlign: TextAlign.justify),
          ),

          //Experience
          const TitleDetail(title: "Experience"),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
            child: Text(
              teacher.experience!,
              overflow: TextOverflow.clip,
              textAlign: TextAlign.justify,
            ),
          ),

          //Interests
          const TitleDetail(title: "Interests"),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
            child: Text(teacher.interests!,
                overflow: TextOverflow.clip,
                softWrap: true,
                textAlign: TextAlign.justify),
          ),

          //Profession
          const TitleDetail(title: "Profession"),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
            child: Text(teacher.profession!,
                overflow: TextOverflow.clip,
                softWrap: true,
                textAlign: TextAlign.justify),
          ),

          //Specialties
          const TitleDetail(title: "Specialties"),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
            child: Wrap(
              children: buildTagsFromList(teacher.specialties!),
            ),
          ),

          //Rating and Comment
          TitleDetail(
              title: "Rating and Comment (${teacher.ratingComments!.length})"),
          Column(
            children: buildCommentItems(teacher.ratingComments!),
          ),
          const SizedBox(
            height: 30,
          )
        ],
      ),
    );
  }

  List<Tag> buildTagsFromList(List<String> list) {
    List<Tag> items = [];
    for (var item in list) {
      items.add(Tag(
        label: item,
      ));
    }
    return items;
  }

  List<Widget> buildCommentItems(List<RatingComment> list) {
    List<Widget> items = [];
    for (var item in list) {
      items.add(MyListTile(
          avatar: AssetImage(item.student!.image!),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                item.student!.fullName!,
                style: titleStyle,
              ),
              Rating(onRatingUpdate: null, rating: item.rating!),
            ],
          ),
          subtitle: Text(
            item.comment!,
            style: const TextStyle(color: Colors.grey, fontSize: 15),
          ),
          trailing: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Column(
              children: [
                Text(
                  DateFormat("HH:mm:ss").format(item.time!),
                  overflow: TextOverflow.clip,
                  style: const TextStyle(fontSize: 11),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  DateFormat("dd-MM-yyyy").format(item.time!),
                  overflow: TextOverflow.clip,
                  style: const TextStyle(fontSize: 11),
                ),
              ],
            ),
          ),
          onTap: null,
          color: Colors.white));
    }
    return items;
  }
}
