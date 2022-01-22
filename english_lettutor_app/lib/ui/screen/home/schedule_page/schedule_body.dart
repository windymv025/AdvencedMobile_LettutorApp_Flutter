import 'package:english_lettutor_app/data/provider/schedule_dto.dart';
import 'package:english_lettutor_app/data/provider/schedule_history_dto.dart';
import 'package:english_lettutor_app/ui/widget/item_view/button/page_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'components/custom_gridview_schedule.dart';
import 'components/upcoming_lession_search.dart';

class ScheduleBody extends StatefulWidget {
  const ScheduleBody({Key? key}) : super(key: key);

  @override
  _ScheduleBodyState createState() => _ScheduleBodyState();
}

class _ScheduleBodyState extends State<ScheduleBody> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ScheduleDTO>(builder: (context, scheduleDTO, _) {
      return RefreshIndicator(
        onRefresh: () async {
          await scheduleDTO.loadScheduleData();
          await Provider.of<ScheduleHistoryDTO>(context, listen: false).init();
        },
        child: CustomScrollView(
          slivers: [
            SliverList(
                delegate: SliverChildListDelegate([
              UpcomingLessionSearch(
                schedule: scheduleDTO.getUpcomingLessionSchedule(),
              ),
            ])),
            SliverPadding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 5.0, vertical: 20),
              sliver:
                  CustomGridViewSchedule(items: scheduleDTO.getScheduleByDay()),
            ),
            SliverList(
              delegate: SliverChildListDelegate([
                scheduleDTO.totalPage == 0
                    ? Container()
                    : Container(
                        margin: const EdgeInsets.only(
                            bottom: 20, left: 15, right: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            scheduleDTO.totalPage == 1
                                ? Container()
                                : PageButton(
                                    onPressed: () {
                                      scheduleDTO.prevPage();
                                    },
                                    text: '<'),
                            PageButton(
                                onPressed: () {
                                  // scheduleDTO.prevPage();
                                },
                                text:
                                    '${scheduleDTO.currentPage} -- ${scheduleDTO.totalPage}'),
                            scheduleDTO.totalPage == 1
                                ? Container()
                                : PageButton(
                                    onPressed: () {
                                      scheduleDTO.nextPage();
                                    },
                                    text: '>')
                          ],
                        ))
              ]),
            )
          ],
        ),
      );
    });
  }
}
