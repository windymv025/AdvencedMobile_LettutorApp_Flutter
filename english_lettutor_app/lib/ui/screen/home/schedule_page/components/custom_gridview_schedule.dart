import 'package:english_lettutor_app/models/teacher/schedule.dart';
import 'package:english_lettutor_app/ui/screen/home/schedule_page/components/item_list_schedules_in_date.dart';
import 'package:english_lettutor_app/ui/widget/item_view/components/no_data_page.dart';
import 'package:flutter/material.dart';

class CustomGridViewSchedule extends StatelessWidget {
  const CustomGridViewSchedule({Key? key, required this.items})
      : super(key: key);

  final Map<String, List<Schedule>>? items;

  @override
  Widget build(BuildContext context) {
    if (items == null || items!.isEmpty) {
      return SliverList(
        delegate: SliverChildListDelegate([
          const NoDataPage(),
        ]),
      );
    }

    List<String> keys = items?.keys.toList() ?? [];

    return SliverList(
        delegate: SliverChildBuilderDelegate(
      (context, index) => ItemListScheduleIndate(
          title: keys[index], schedules: items![keys[index]]!),
      childCount: keys.length,
    ));
  }
}
