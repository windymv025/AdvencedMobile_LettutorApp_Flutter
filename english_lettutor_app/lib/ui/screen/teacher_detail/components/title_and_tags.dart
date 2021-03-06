import 'package:english_lettutor_app/ui/screen/teacher_detail/components/title_detail.dart';
import 'package:english_lettutor_app/ui/widget/item_view/components/tag.dart';
import 'package:flutter/material.dart';

class TitleAndTags extends StatelessWidget {
  const TitleAndTags({Key? key, required this.tags, required this.title})
      : super(key: key);
  final String title;
  final List<String?>? tags;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleDetail(title: title),
        Padding(
          padding: const EdgeInsets.only(left: 25, bottom: 10),
          child: Wrap(
            children: tags != null ? buildTagsFromList(tags!) : List.empty(),
          ),
        ),
      ],
    );
  }

  List<Tag> buildTagsFromList(List<String?> list) {
    List<Tag> items = [];

    for (var item in list) {
      items.add(Tag(
        label: item.toString(),
      ));
    }
    return items;
  }
}
