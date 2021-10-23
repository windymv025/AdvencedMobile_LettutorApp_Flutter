import 'package:english_lettutor_app/ui/screen/teacher_detail/components/action/bottom_sheet/booking_grid_view.dart';
import 'package:english_lettutor_app/utilities/design/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void showDateTimeBottomSheet(BuildContext context, List<DateTime>? items,
    [String typeDateTime = BookingGridView.typeDate]) {
  Size size = MediaQuery.of(context).size;
  showModalBottomSheet(
      context: context,
      builder: (context) {
        return SizedBox(
            height: size.height * 0.6,
            child: CustomScrollView(
              slivers: [
                const SliverAppBar(
                  centerTitle: true,
                  backgroundColor: Colors.white,
                  title: Text(
                    "Pick your date",
                    style: pageNameStyle,
                  ),
                  leading: SizedBox.shrink(),
                ),
                BookingGridView(
                  size: size,
                  items: items,
                  typeDateTime: typeDateTime,
                )
              ],
            ));
      },
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(38), topRight: Radius.circular(38)),
      ));
}
