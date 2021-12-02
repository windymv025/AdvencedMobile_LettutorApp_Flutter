import 'package:english_lettutor_app/constants/constants.dart';
import 'package:english_lettutor_app/constants/design/styles.dart';
import 'package:english_lettutor_app/data/provider/teacher_dto.dart';
import 'package:english_lettutor_app/models/teacher/teacher.dart';
import 'package:english_lettutor_app/ui/screen/home/home_page/components/custom_grid_view.dart';
import 'package:english_lettutor_app/ui/widget/item_view/bar/search_bar_title.dart';
import 'package:english_lettutor_app/ui/widget/item_view/button/page_button.dart';
import 'package:english_lettutor_app/ui/widget/item_view/components/tag.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TeacherPage extends StatefulWidget {
  const TeacherPage({Key? key}) : super(key: key);

  @override
  TeacherPageState createState() => TeacherPageState();
}

class TeacherPageState extends State<TeacherPage> {
  late TeacherDTO teacherDTO;
  List<Teacher> _teachers = [];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    teacherDTO = Provider.of<TeacherDTO>(context, listen: true);
    _teachers = teacherDTO.items;
  }

  void reload() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return CustomScrollView(
      slivers: [
        SliverList(
            delegate: SliverChildListDelegate([
          const SearchBarTitle(),
          const Padding(
            padding: EdgeInsets.only(left: 12, top: 15),
            child: Text(
              "Filter teachers by Specialization",
              style: titleStyle,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
            child: Wrap(
              spacing: 5,
              children: kSpecialities.map((speciality) {
                return _buildTag(speciality);
              }).toList(),
            ),
          ),
        ])),
        SliverPadding(
          padding: const EdgeInsets.only(bottom: 10, left: 8, right: 8),
          sliver: CustomGridView(
              size: size, items: teacherDTO.getItemInCurrentPage()),
        ),
        SliverList(
          delegate: SliverChildListDelegate([
            Container(
                margin: const EdgeInsets.only(bottom: 20, left: 15, right: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    PageButton(
                        onPressed: () {
                          teacherDTO.prevPage();
                        },
                        text: '<'),
                    PageButton(
                        onPressed: () {
                          teacherDTO.prevPage();
                        },
                        text:
                            '${teacherDTO.currentPage} -- ${teacherDTO.totalPage}'),
                    PageButton(
                        onPressed: () {
                          teacherDTO.nextPage();
                        },
                        text: '>')
                  ],
                ))
          ]),
        )
      ],
    );
  }

  Widget _buildTag(String label) {
    return Tag(
      label: label,
      canPress: true,
      focus: label == kAllTeachers && teacherDTO.getSpecialities().isEmpty,
    );
  }
}