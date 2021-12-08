import 'package:english_lettutor_app/constants/design/styles.dart';
import 'package:english_lettutor_app/generated/l10n.dart';
import 'package:english_lettutor_app/ui/screen/teacher_detail/components/action/bottom_sheet/booking_grid_view.dart';
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
                SliverAppBar(
                  centerTitle: true,
                  backgroundColor: Colors.white,
                  title: Text(
                    S.current.pick_date,
                    style: pageNameStyle,
                  ),
                  leading: const SizedBox.shrink(),
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
