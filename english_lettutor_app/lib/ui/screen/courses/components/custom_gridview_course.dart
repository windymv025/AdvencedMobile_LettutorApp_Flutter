import 'package:english_lettutor_app/models/course.dart';
import 'package:english_lettutor_app/ui/widget/item_list/course_item.dart';
import 'package:english_lettutor_app/ui/widget/item_view/no_data_page.dart';
import 'package:english_lettutor_app/utilities/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class CustomGridViewCourse extends StatelessWidget {
  const CustomGridViewCourse(
      {Key? key, required this.size, required this.items})
      : super(key: key);

  final List<Course>? items;
  final Size size;

  @override
  Widget build(BuildContext context) {
    BoxConstraints dimens =
        BoxConstraints(maxHeight: size.height, maxWidth: size.width);
    int columnRatio = getColumRatio(context, dimens);

    if (items == null || items!.isEmpty) {
      return const NoDataPage();
    }
    return SliverStaggeredGrid.countBuilder(
        crossAxisCount: 12,
        staggeredTileBuilder: (index) => StaggeredTile.fit(columnRatio),
        itemBuilder: (context, index) => Container(
            margin: const EdgeInsets.all(4),
            child: CourseItem(
              image: Image.asset(items![index].image!),
              name: items![index].name!,
              subTitile: items![index].subtitle!,
              lessons: items![index].lessons,
              level: items![index].level!,
            )),
        itemCount: items!.length);
  }

  int getColumRatio(context, dimens) {
    int columRatio = 6;
    if (dimens.maxWidth <= kMobileBreakpoint) {
      columRatio = 6;
    } else if (dimens.maxWidth > kMobileBreakpoint &&
        dimens.maxWidth <= kTabletBreakpoint) {
      columRatio = 4;
    } else if (dimens.maxWidth > kTabletBreakpoint &&
        dimens.maxWidth <= kDesktopBreakPoint) {
      columRatio = 3;
    } else {
      columRatio = 2;
    }
    return columRatio;
  }
}
