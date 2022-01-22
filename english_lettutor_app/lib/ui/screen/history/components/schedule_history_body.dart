import 'package:english_lettutor_app/data/provider/schedule_history_dto.dart';
import 'package:english_lettutor_app/ui/screen/history/components/custom_gridview_history.dart';
import 'package:english_lettutor_app/ui/widget/item_view/bar/search_bar_title.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ScheduleHistoryBody extends StatefulWidget {
  const ScheduleHistoryBody({Key? key}) : super(key: key);

  @override
  _ScheduleHistoryBodyState createState() => _ScheduleHistoryBodyState();
}

class _ScheduleHistoryBodyState extends State<ScheduleHistoryBody> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ScheduleHistoryDTO scheduleHistoryDTO = context.watch<ScheduleHistoryDTO>();

    return RefreshIndicator(
      onRefresh: () async {
        await scheduleHistoryDTO.init();
      },
      child: CustomScrollView(
        slivers: [
          SliverList(
              delegate: SliverChildListDelegate([
            const SearchBarTitle(),
            const SizedBox(
              height: 20,
            ),
          ])),
          CustomGridViewHistory(size: size, items: scheduleHistoryDTO.items),
          SliverList(
              delegate: SliverChildListDelegate([
            const SizedBox(
              height: 30,
            ),
          ])),
        ],
      ),
    );
  }
}
