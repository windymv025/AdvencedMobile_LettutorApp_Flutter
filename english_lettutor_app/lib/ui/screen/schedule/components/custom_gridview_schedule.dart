import 'package:english_lettutor_app/models/schedule.dart';
import 'package:english_lettutor_app/ui/screen/schedule/components/schedule_item.dart';
import 'package:english_lettutor_app/ui/widget/item_view/components/no_data_page.dart';
import 'package:english_lettutor_app/utilities/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class CustomGridViewSchedule extends StatelessWidget {
  const CustomGridViewSchedule(
      {Key? key, required this.size, required this.items})
      : super(key: key);

  final List<Schedule>? items;
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
        crossAxisSpacing: 5,
        mainAxisSpacing: 5,
        staggeredTileBuilder: (index) => StaggeredTile.fit(columnRatio),
        itemBuilder: (context, index) => Container(
              margin: const EdgeInsets.all(4),
              child: ScheduleItem(
                schedule: items![index],
              ),
            ),
        itemCount: items!.length);
  }

  int getColumRatio(context, dimens) {
    int columRatio = 12;
    if (dimens.maxWidth <= kMobileBreakpoint) {
      columRatio = 12;
    } else if (dimens.maxWidth > kMobileBreakpoint &&
        dimens.maxWidth <= kTabletBreakpoint) {
      columRatio = 6;
    } else if (dimens.maxWidth > kTabletBreakpoint &&
        dimens.maxWidth <= kDesktopBreakPoint) {
      columRatio = 4;
    } else {
      columRatio = 3;
    }
    return columRatio;
  }
}
