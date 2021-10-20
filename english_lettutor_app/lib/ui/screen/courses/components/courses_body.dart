import 'package:english_lettutor_app/models/course.dart';
import 'package:english_lettutor_app/ui/screen/courses/components/custom_gridview_course.dart';
import 'package:english_lettutor_app/ui/screen/home/components/search_bar_title.dart';
import 'package:english_lettutor_app/ui/screen/profile/components/custom_drop_down.dart';
import 'package:english_lettutor_app/utilities/constants/constants.dart';
import 'package:english_lettutor_app/utilities/constants/styles.dart';
import 'package:flutter/material.dart';

class CoursesBody extends StatefulWidget {
  const CoursesBody({Key? key}) : super(key: key);

  @override
  _CoursesBodyState createState() => _CoursesBodyState();
}

class _CoursesBodyState extends State<CoursesBody> {
  List<Course> coures = [];
  String? _level;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    loadListCourse();
    return CustomScrollView(
      slivers: [
        SliverList(
            delegate: SliverChildListDelegate(
          [
            SearchBarTitle(
              size: size,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 10, top: 10, bottom: 10),
              child: Text(
                "Filter courses",
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
        CustomGridViewCourse(size: size, items: coures),
      ],
    );
  }

  loadListCourse() {
    //todo
    coures.add(Course.getDefault());
    coures.add(Course.getDefault());
    coures.add(Course.getDefault());
    coures.add(Course.getDefault());
    coures.add(Course.getDefault());
    coures.add(Course.getDefault());
    coures.add(Course.getDefault());
    coures.add(Course.getDefault());
    coures.add(Course.getDefault());
    coures.add(Course.getDefault());
    coures.add(Course.getDefault());
    coures.add(Course.getDefault());
    coures.add(Course.getDefault());
    coures.add(Course.getDefault());
  }
}
