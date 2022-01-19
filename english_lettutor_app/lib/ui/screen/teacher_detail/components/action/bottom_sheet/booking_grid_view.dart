import 'package:english_lettutor_app/constants/constants.dart';
import 'package:english_lettutor_app/constants/design/styles.dart';
import 'package:english_lettutor_app/data/provider/teacher_dto.dart';
import 'package:english_lettutor_app/ui/widget/item_view/sheet/bottom_sheet.dart';
import 'package:english_lettutor_app/ui/widget/item_view/components/no_data_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';

class BookingGridView extends StatelessWidget {
  static const typeDate = "dd-MM-yyyy";
  static const typeTime = "HH:mm";
  const BookingGridView(
      {Key? key,
      required this.size,
      required this.items,
      this.typeDateTime = typeDate})
      : super(key: key);

  final List<String>? items;
  final Size size;
  final String typeDateTime;

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

    TeacherDTO teacherDTO = Provider.of<TeacherDTO>(context);

    return SliverStaggeredGrid.countBuilder(
        crossAxisCount: 12,
        staggeredTileBuilder: (index) => StaggeredTile.fit(columnRatio),
        itemBuilder: (context, index) => Container(
              margin: const EdgeInsets.all(4),
              child: OutlinedButton(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    items![index],
                    style: const TextStyle(fontSize: textSizeTitle),
                  ),
                ),
                onPressed: () {
                  showTimeBottomSheet(
                      context, teacherDTO.getFreeTime(items![index]));
                },
                style: outlineButtonStyle,
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
      columRatio = 12;
    } else if (dimens.maxWidth > kTabletBreakpoint &&
        dimens.maxWidth <= kDesktopBreakPoint) {
      columRatio = 6;
    } else {
      columRatio = 4;
    }
    return columRatio;
  }
}
