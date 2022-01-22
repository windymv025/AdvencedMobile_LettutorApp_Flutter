import 'package:english_lettutor_app/constants/constants.dart';
import 'package:english_lettutor_app/models/teacher/schedule.dart';
import 'package:flutter/material.dart';

import 'schedule_item.dart';

class ItemListScheduleIndate extends StatefulWidget {
  const ItemListScheduleIndate(
      {Key? key, required this.title, required this.schedules})
      : super(key: key);
  final String title;
  final List<Schedule> schedules;

  @override
  _ItemListScheduleIndateState createState() => _ItemListScheduleIndateState();
}

class _ItemListScheduleIndateState extends State<ItemListScheduleIndate> {
  bool isExpanded = true;
  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          InkWell(
            onTap: () {
              setState(() {
                isExpanded = !isExpanded;
              });
            },
            child: Row(
              children: [
                isExpanded
                    ? const Icon(Icons.arrow_drop_down_rounded)
                    : const Icon(Icons.arrow_right_rounded),
                Text(widget.title,
                    style: Theme.of(context).textTheme.bodyText1,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis),
              ],
            ),
          ),
          isExpanded ? getScheduleItems(context) : Container(),
        ]);
  }

  Widget getScheduleItems(BuildContext context) {
    return Column(
        children: getRowItems(context), mainAxisSize: MainAxisSize.min);
  }

  List<Widget> getRowItems(BuildContext context) {
    List<Widget> result = [];
    int itemCount = widget.schedules.length;
    Size size = MediaQuery.of(context).size;
    BoxConstraints dimens =
        BoxConstraints(maxHeight: size.height, maxWidth: size.width);
    int itemInRow = getColumRatio(context, dimens);

    int rowCount = (itemCount / itemInRow).ceil();

    for (int i = 0; i < rowCount; i++) {
      result.add(Container(
        margin: const EdgeInsets.only(left: 20, right: 15),
        child: Row(
          children: [
            for (int j = 0; j < itemInRow; j++)
              if (i * itemInRow + j < itemCount)
                Container(
                  margin: const EdgeInsets.only(right: 5),
                  width: (size.width - 47 - 5 * itemInRow) / itemInRow,
                  child: ScheduleItem(
                    schedule: widget.schedules[i * itemInRow + j],
                  ),
                ),
          ],
        ),
      ));
    }

    return result;
  }

  int getColumRatio(context, dimens) {
    int columRatio = 1;
    if (dimens.maxWidth <= kMobileBreakpoint) {
      columRatio = 1;
    } else if (dimens.maxWidth > kMobileBreakpoint &&
        dimens.maxWidth <= kTabletBreakpoint) {
      columRatio = 2;
    } else if (dimens.maxWidth > kTabletBreakpoint &&
        dimens.maxWidth <= kDesktopBreakPoint) {
      columRatio = 3;
    } else {
      columRatio = 4;
    }
    return columRatio;
  }
}
