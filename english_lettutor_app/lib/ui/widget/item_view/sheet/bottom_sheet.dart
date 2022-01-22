import 'package:english_lettutor_app/constants/design/styles.dart';
import 'package:english_lettutor_app/data/provider/teacher_dto.dart';
import 'package:english_lettutor_app/generated/l10n.dart';
import 'package:english_lettutor_app/models/schedule/schedule-teacher.dart';
import 'package:english_lettutor_app/ui/screen/teacher_detail/components/action/bottom_sheet/booking-time-gridview.dart';
import 'package:english_lettutor_app/ui/screen/teacher_detail/components/action/bottom_sheet/booking_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void showDateTimeBottomSheet(BuildContext context, String id,
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
                teacherId: id,
                typeDateTime: typeDateTime,
              )
            ],
          ));
    },
  );
}

void showTimeBottomSheet(
  BuildContext context,
  List<ScheduleDetail>? item,
) {
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
                  S.current.pick_time,
                  style: pageNameStyle,
                ),
                leading: const SizedBox.shrink(),
              ),
              BookingTimeGirdView(
                size: size,
                items: item,
              )
            ],
          ));
    },
  );
}
