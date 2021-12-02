import 'package:english_lettutor_app/models/teacher/schedule_history.dart';
import 'package:english_lettutor_app/ui/screen/history/components/custom_gridview_history.dart';
import 'package:english_lettutor_app/ui/widget/item_view/bar/search_bar_title.dart';
import 'package:flutter/material.dart';

class ScheduleHistoryBody extends StatefulWidget {
  const ScheduleHistoryBody({Key? key}) : super(key: key);

  @override
  _ScheduleHistoryBodyState createState() => _ScheduleHistoryBodyState();
}

class _ScheduleHistoryBodyState extends State<ScheduleHistoryBody> {
  List<ScheduleHistory> scheduleHistorys = [];
  @override
  Widget build(BuildContext context) {
    loadListHistory();
    Size size = MediaQuery.of(context).size;
    return CustomScrollView(
      slivers: [
        SliverList(
            delegate: SliverChildListDelegate([
          const SearchBarTitle(),
          const SizedBox(
            height: 20,
          ),
        ])),
        CustomGridViewHistory(size: size, items: scheduleHistorys),
        SliverList(
            delegate: SliverChildListDelegate([
          const SizedBox(
            height: 30,
          ),
        ])),
      ],
    );
  }

  loadListHistory() {
    scheduleHistorys.add(ScheduleHistory.getDefault());
    scheduleHistorys.add(ScheduleHistory.getDefault());
    scheduleHistorys.add(ScheduleHistory.getDefault());
    scheduleHistorys.add(ScheduleHistory.getDefault());
    scheduleHistorys.add(ScheduleHistory.getDefault());
    scheduleHistorys.add(ScheduleHistory.getDefault());
    scheduleHistorys.add(ScheduleHistory.getDefault());
    scheduleHistorys.add(ScheduleHistory.getDefault());
    scheduleHistorys.add(ScheduleHistory.getDefault());
    scheduleHistorys.add(ScheduleHistory.getDefault());
    scheduleHistorys.add(ScheduleHistory.getDefault());
  }
}
