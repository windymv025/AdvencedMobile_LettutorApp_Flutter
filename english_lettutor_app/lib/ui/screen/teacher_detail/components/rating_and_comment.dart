import 'package:english_lettutor_app/models/rating_comment.dart';
import 'package:english_lettutor_app/models/teacher.dart';
import 'package:english_lettutor_app/ui/widget/item_list/my_list_tile.dart';
import 'package:english_lettutor_app/ui/widget/item_view/components/rating.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'title_detail.dart';

class RatingAndComment extends StatelessWidget {
  const RatingAndComment({Key? key, required this.teacher}) : super(key: key);
  final Teacher teacher;

  get titleStyle => null;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TitleDetail(
            title: "Rating and Comment (${teacher.ratingComments!.length})"),
        Column(
          children: buildCommentItems(teacher.ratingComments!),
        ),
        const SizedBox(
          height: 30,
        )
      ],
    );
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
