import 'package:english_lettutor_app/constants/constants.dart';
import 'package:english_lettutor_app/constants/design/styles.dart';
import 'package:english_lettutor_app/data/provider/course_dto.dart';
import 'package:english_lettutor_app/ui/screen/profile/components/custom_drop_down.dart';
import 'package:english_lettutor_app/ui/widget/item_view/bar/search_bar_title.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'components/custom_gridview_course.dart';

class CoursesBody extends StatefulWidget {
  const CoursesBody({Key? key}) : super(key: key);

  @override
  _CoursesBodyState createState() => _CoursesBodyState();
}

class _CoursesBodyState extends State<CoursesBody> {
  String? _level;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final CourseDTO courseDTO = context.watch<CourseDTO>();
    return CustomScrollView(
      slivers: [
        SliverList(
            delegate: SliverChildListDelegate(
          [
            const SearchBarTitle(),
            const Padding(
              padding: EdgeInsets.only(left: 10, top: 10, bottom: 10),
              child: Text(
                "Filter courses",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: titleStyle,
              ),
            ),
            //Filter
            Container(
              // constraints: const BoxConstraints(maxWidth: 100),
              margin: const EdgeInsets.fromLTRB(15, 0, 15, 15),
              child: CustomDropDown(
                  icon: Icons.format_list_numbered_rounded,
                  onChanged: (newValue) {
                    setState(() {
                      _level = newValue;
                    });
                  },
                  hint: "Choose your level",
                  value: _level,
                  title: "My level",
                  items: kLevels),
            ),
          ],
        )),
        CustomGridViewCourse(size: size, items: courseDTO.items),
      ],
    );
  }
}