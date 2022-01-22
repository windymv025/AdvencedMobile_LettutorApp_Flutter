import 'package:english_lettutor_app/constants/constants.dart';
import 'package:english_lettutor_app/constants/design/styles.dart';
import 'package:english_lettutor_app/data/provider/teacher_dto.dart';
import 'package:english_lettutor_app/generated/l10n.dart';
import 'package:english_lettutor_app/models/schedule/schedule-teacher.dart';
import 'package:english_lettutor_app/ui/widget/item_view/components/no_data_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class BookingTimeGirdView extends StatefulWidget {
  const BookingTimeGirdView({Key? key, this.items, required this.size})
      : super(key: key);
  final List<ScheduleDetail>? items;
  final Size size;

  @override
  _BookingTimeGirdViewState createState() => _BookingTimeGirdViewState();
}

class _BookingTimeGirdViewState extends State<BookingTimeGirdView> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    BoxConstraints dimens = BoxConstraints(
        maxHeight: widget.size.height, maxWidth: widget.size.width);
    int columnRatio = getColumRatio(context, dimens);

    if (widget.items == null || widget.items!.isEmpty) {
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
              child: isLoading
                  ? Center(
                      child: CircularProgressIndicator(
                        valueColor:
                            const AlwaysStoppedAnimation(kMainBlueColor),
                        backgroundColor: Colors.grey[200],
                      ),
                    )
                  : OutlinedButton(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Text(
                          "${DateFormat(DateFormat.HOUR24_MINUTE).format(DateTime.fromMillisecondsSinceEpoch(widget.items![index].startPeriodTimestamp!).toLocal())} - ${DateFormat(DateFormat.HOUR24_MINUTE).format(DateTime.fromMillisecondsSinceEpoch(widget.items![index].endPeriodTimestamp!).toLocal())}",
                          style: const TextStyle(fontSize: textSizeTitle),
                        ),
                      ),
                      onPressed: () {
                        setState(() {
                          isLoading = true;
                        });
                        teacherDTO
                            .bookingTeacher(widget.items![index].id!)
                            .then((value) {
                          if (value) {
                            Fluttertoast.showToast(
                                msg: S.current.booking_success,
                                toastLength: Toast.LENGTH_LONG,
                                gravity: ToastGravity.CENTER,
                                timeInSecForIosWeb: 2,
                                fontSize: 16.0);
                            Navigator.pop(context);
                            Navigator.pop(context);
                          } else {
                            Fluttertoast.showToast(
                                msg: S.current.booking_fail,
                                toastLength: Toast.LENGTH_LONG,
                                gravity: ToastGravity.CENTER,
                                timeInSecForIosWeb: 2,
                                fontSize: 16.0);
                          }
                          setState(() {
                            isLoading = false;
                          });
                        });
                      },
                      style: outlineButtonStyle,
                    ),
            ),
        itemCount: widget.items!.length);
  }

  int getColumRatio(context, dimens) {
    int columRatio = 12;
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
