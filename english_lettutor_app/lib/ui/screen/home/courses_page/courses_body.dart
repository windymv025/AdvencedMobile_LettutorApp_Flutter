import 'package:english_lettutor_app/constants/constants.dart';
import 'package:english_lettutor_app/constants/design/styles.dart';
import 'package:english_lettutor_app/data/provider/course_dto.dart';
import 'package:english_lettutor_app/ui/screen/profile/components/custom_drop_down.dart';
import 'package:english_lettutor_app/ui/widget/item_view/bar/search_bar_title.dart';
import 'package:english_lettutor_app/ui/widget/item_view/button/page_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'components/custom_gridview_course.dart';

class CoursesBody extends StatefulWidget {
  const CoursesBody({Key? key}) : super(key: key);

  @override
  _CoursesBodyState createState() => _CoursesBodyState();
}

class _CoursesBodyState extends State<CoursesBody> {
  String? _level = "All";
  final _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final CourseDTO courseDTO = context.watch<CourseDTO>();
    return CustomScrollView(
      slivers: [
        SliverList(
            delegate: SliverChildListDelegate(
          [
            SearchBarTitle(
              onTextChanged: (value) {
                courseDTO.search(value);
              },
              textEditingController: _textEditingController,
            ),
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
              margin: const EdgeInsets.fromLTRB(15, 0, 15, 15),
              child: CustomDropDown(
                  icon: Icons.format_list_numbered_rounded,
                  onChanged: (newValue) {
                    setState(() {
                      _level = newValue;
                      courseDTO.getCourseListByLevel(_level!);
                    });
                  },
                  hint: "Choose your level",
                  value: _level,
                  title: "My level",
                  items: ["All"] + kLevels),
            ),
          ],
        )),
        CustomGridViewCourse(
            size: size, items: courseDTO.getItemInCurrentPage()),
        SliverList(
          delegate: SliverChildListDelegate([
            courseDTO.totalPage == 0
                ? Container()
                : Container(
                    margin:
                        const EdgeInsets.only(bottom: 20, left: 15, right: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        courseDTO.totalPage == 1
                            ? Container()
                            : PageButton(
                                onPressed: () {
                                  courseDTO.prevPage();
                                },
                                text: '<'),
                        PageButton(
                            onPressed: () {
                              courseDTO.prevPage();
                            },
                            text:
                                '${courseDTO.currentPage} -- ${courseDTO.totalPage}'),
                        courseDTO.totalPage == 1
                            ? Container()
                            : PageButton(
                                onPressed: () {
                                  courseDTO.nextPage();
                                },
                                text: '>')
                      ],
                    ))
          ]),
        )
      ],
    );
  }
}
