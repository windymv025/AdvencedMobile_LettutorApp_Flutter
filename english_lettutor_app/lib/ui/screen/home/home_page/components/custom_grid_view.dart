import 'package:english_lettutor_app/constants/constants.dart';
import 'package:english_lettutor_app/models/teacher/teacher.dart';
import 'package:english_lettutor_app/ui/widget/item_list/tutor_item.dart';
import 'package:english_lettutor_app/ui/widget/item_view/components/no_data_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class CustomGridView extends StatelessWidget {
  const CustomGridView({Key? key, required this.size, required this.items})
      : super(key: key);
  final List<Teacher>? items;
  final Size size;

  @override
  Widget build(BuildContext context) {
    BoxConstraints dimens =
        BoxConstraints(maxHeight: size.height, maxWidth: size.width);
    int columnRatio = getColumnRatio(context, dimens);

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
              child: TutorItem(
                teacher: items![index],
              ),
            ),
        itemCount: items!.length);
  }

  int getColumnRatio(context, dimens) {
    int columnRatio = 12;
    if (dimens.maxWidth <= kMobileBreakpoint) {
      columnRatio = 12;
    } else if (dimens.maxWidth > kMobileBreakpoint &&
        dimens.maxWidth <= kTabletBreakpoint) {
      columnRatio = 6;
    } else if (dimens.maxWidth > kTabletBreakpoint &&
        dimens.maxWidth <= kDesktopBreakPoint) {
      columnRatio = 4;
    } else {
      columnRatio = 3;
    }
    return columnRatio;
  }
}
