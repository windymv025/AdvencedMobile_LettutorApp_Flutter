import 'package:english_lettutor_app/constants/constants.dart';
import 'package:english_lettutor_app/constants/design/styles.dart';
import 'package:english_lettutor_app/data/provider/teacher_dto.dart';
import 'package:english_lettutor_app/ui/widget/item_view/sheet/bottom_sheet.dart';
import 'package:english_lettutor_app/ui/widget/item_view/components/no_data_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';

class BookingGridView extends StatefulWidget {
  static const typeDate = "dd-MM-yyyy";
  static const typeTime = "HH:mm";
  const BookingGridView(
      {Key? key,
      required this.size,
      required this.teacherId,
      this.typeDateTime = typeDate})
      : super(key: key);

  final String teacherId;
  final Size size;
  final String typeDateTime;

  @override
  _BookingGridViewState createState() => _BookingGridViewState();
}

class _BookingGridViewState extends State<BookingGridView> {
  bool isLoading = true;
  late TeacherDTO teacherDTO;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    teacherDTO = Provider.of<TeacherDTO>(context);
    teacherDTO.loadScheduleTeacher(widget.teacherId).then((value) {
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return SliverList(
        delegate: SliverChildListDelegate([
          SizedBox(
              height: widget.size.height * 0.5,
              width: widget.size.width,
              child: Center(
                child: CircularProgressIndicator(
                  valueColor: const AlwaysStoppedAnimation(kMainBlueColor),
                  backgroundColor: Colors.grey[200],
                ),
              ))
        ]),
      );
    }

    BoxConstraints dimens = BoxConstraints(
        maxHeight: widget.size.height, maxWidth: widget.size.width);
    int columnRatio = getColumRatio(context, dimens);
    var items = teacherDTO.getFreeDate(widget.teacherId);

    if (items.isEmpty) {
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
              child: OutlinedButton(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    items[index],
                    style: const TextStyle(fontSize: textSizeTitle),
                  ),
                ),
                onPressed: () {
                  showTimeBottomSheet(
                      context, teacherDTO.getFreeTime(items[index]));
                },
                style: outlineButtonStyle,
              ),
            ),
        itemCount: items.length);
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
