import 'package:english_lettutor_app/ui/screen/teacher_detail/components/title_detail.dart';
import 'package:english_lettutor_app/ui/widget/item_view/components/tag.dart';
import 'package:flutter/material.dart';

class TitleAndTags extends StatelessWidget {
  const TitleAndTags({Key? key, required this.tags, required this.title})
      : super(key: key);
  final String title;
  final List<String> tags;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TitleDetail(title: "Specialties"),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
          child: Wrap(
            children: buildTagsFromList(tags),
          ),
        ),
      ],
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
}
