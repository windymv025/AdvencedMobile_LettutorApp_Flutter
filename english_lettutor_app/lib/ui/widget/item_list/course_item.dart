import 'package:english_lettutor_app/constants/assets.dart';
import 'package:english_lettutor_app/constants/constants.dart';
import 'package:english_lettutor_app/constants/design/styles.dart';
import 'package:english_lettutor_app/generated/l10n.dart';
import 'package:english_lettutor_app/models/course/course.dart';
import 'package:english_lettutor_app/ui/screen/course_detail/course_detail_screen.dart';
import 'package:flutter/material.dart';

class CourseItem extends StatelessWidget {
  const CourseItem({
    Key? key,
    required this.course,
  }) : super(key: key);
  final Course course;

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;

    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, CourseDetailScreen.routeName,
            arguments: course);
      },
      child: Container(
        decoration: BoxDecoration(
            boxShadow: isDark
                ? null
                : [
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
                child: getImage(course.image), //image
              ),
              Container(
                constraints: const BoxConstraints(maxWidth: 400),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(5, 10, 5, 0),
                      child: Text(
                        course.name ?? '',
                        style: titleStyle,
                        maxLines: 2,
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        course.subtitle ?? '',
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
                          Expanded(
                            child: Text(
                              '${course.level ?? ''} • ${course.lessons} ${S.current.lessons}',
                              overflow: TextOverflow.clip,
                              textAlign: TextAlign.center,
                            ),
                          ),
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

  Image getImage(String? ulr) {
    if (ulr == null) {
      return Image.asset(
        Assets.assetsImagesCourseImage,
      );
    }
    return Image.network(ulr);
  }
}
