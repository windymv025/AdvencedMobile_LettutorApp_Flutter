import 'package:english_lettutor_app/ui/screen/course_detail/course_detail_screen.dart';
import 'package:english_lettutor_app/utilities/constants/constants.dart';
import 'package:english_lettutor_app/utilities/constants/styles.dart';
import 'package:flutter/material.dart';

class CourseItem extends StatelessWidget {
  const CourseItem(
      {Key? key,
      required this.image,
      required this.name,
      required this.subTitile,
      required this.level,
      required this.lessons})
      : super(key: key);
  final Image image;
  final String name;
  final String subTitile;
  final String level;
  final int lessons;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, CourseDetailScreen.routeName);
      },
      child: Container(
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            offset: const Offset(0, 10),
            blurRadius: 20,
            color: kPrimaryColor.withOpacity(0.23),
          ),
        ]),
        height: 250,
        child: Card(
          child: Column(
            children: [
              Expanded(
                child: image, //image
              ),
              Container(
                constraints: const BoxConstraints(maxWidth: 400),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(5, 10, 5, 0),
                      child: Text(
                        name,
                        style: titleStyle,
                        maxLines: 2,
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        subTitile,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        style:
                            const TextStyle(color: Colors.grey, fontSize: 12),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.all(5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(level),
                          const Text(" • "),
                          Text("$lessons Lessons")
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
