import 'package:english_lettutor_app/ui/widget/item_view/rating.dart';
import 'package:english_lettutor_app/ui/widget/item_view/tag/tag.dart';
import 'package:english_lettutor_app/utilities/constants/constants.dart';
import 'package:english_lettutor_app/utilities/constants/styles.dart';
import 'package:flutter/material.dart';

class YourTeacherItem extends StatelessWidget {
  const YourTeacherItem(
      {Key? key,
      required this.image,
      required this.name,
      required this.ratings,
      required this.tags})
      : super(key: key);
  final Image image;
  final String name;
  final double ratings;
  final List<String> tags;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          offset: const Offset(0, 10),
          blurRadius: 20,
          color: kPrimaryColor.withOpacity(0.23),
        ),
      ]),
      height: 200,
      child: Card(
        child: Column(
          children: [
            Expanded(
              child: image, //image
            ),
            Container(
              width: 160,
              color: kCardTeacherColor, //Background color
              child: Expanded(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 10, 5, 0),
                      child: Text(
                        name,
                        style: titleStyleWhite,
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Rating(
                      rating: ratings,
                      onRatingUpdate: () {},
                    ),
                    Container(
                      margin: const EdgeInsets.all(5),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: buildTags(),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  List<Widget> buildTags() {
    List<Tag> result = [];
    for (var i in tags) {
      result.add(Tag(label: i));
    }

    return result;
  }
}
