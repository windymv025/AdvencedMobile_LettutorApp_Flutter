import 'package:english_lettutor_app/constants/assets.dart';
import 'package:english_lettutor_app/constants/constants.dart';
import 'package:english_lettutor_app/models/course/course.dart';
import 'package:english_lettutor_app/ui/widget/item_list/course_item.dart';
import 'package:english_lettutor_app/ui/widget/item_view/components/no_data_page.dart';
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
      return SliverList(
        delegate: SliverChildListDelegate([
          const NoDataPage(),
        ]),
      );
    }
    return SliverStaggeredGrid.countBuilder(
        crossAxisCount: 12,
        staggeredTileBuilder: (index) => StaggeredTile.fit(columnRatio),
        itemBuilder: (context, index) => Container(
            margin: const EdgeInsets.all(4),
            child: CourseItem(
              course: items![index],
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

  Image getImage(String? ulr) {
    if (ulr == null) {
      return Image.asset(
        Assets.assetsImagesCourseImage,
        fit: BoxFit.cover,
      );
    }
    return Image.asset(
      ulr,
      fit: BoxFit.cover,
    );
  }
}
