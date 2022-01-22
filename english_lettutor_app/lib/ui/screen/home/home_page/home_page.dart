import 'package:english_lettutor_app/data/provider/course_dto.dart';
import 'package:english_lettutor_app/data/provider/home_state.dart';
import 'package:english_lettutor_app/data/provider/schedule_dto.dart';
import 'package:english_lettutor_app/data/provider/schedule_history_dto.dart';
import 'package:english_lettutor_app/data/provider/teacher_dto.dart';
import 'package:english_lettutor_app/generated/l10n.dart';
import 'package:english_lettutor_app/ui/screen/home/schedule_page/components/upcoming_lession_search.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'components/list_recommended_teacher.dart';
import 'components/recommended_courses.dart';
import 'components/title_and_button.dart';
import 'components/welcome_with_search.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void initData() {
    Provider.of<ScheduleDTO>(context, listen: false).init();
    Provider.of<TeacherDTO>(context, listen: false).init();
    Provider.of<ScheduleHistoryDTO>(context, listen: false).init();
    Provider.of<CourseDTO>(context, listen: false).init();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ScheduleDTO scheduleDTO = Provider.of<ScheduleDTO>(context);

    return Consumer<HomeState>(builder: (context, homeState, _) {
      return RefreshIndicator(
        onRefresh: () async {
          initData();
        },
        child: CustomScrollView(
          slivers: [
            SliverList(
                delegate: SliverChildListDelegate([
              // welcome
              scheduleDTO.items.isEmpty
                  ? WelcomeWithSearch(size: size)
                  : UpcomingLessionSearch(
                      schedule: scheduleDTO.getUpcomingLessionSchedule()),
              //your teacher
              TitleAndButton(
                onPressed: () {
                  homeState.pageIndex = 3;
                },
                title: S.current.Recommended_Course,
                textButton: S.current.More,
              ),
              //listView
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 5),
                child: RecommendedCourse(),
              ),
              // see all
              TitleAndButton(
                onPressed: () {
                  homeState.pageIndex = 2;
                },
                title: S.current.Recommended_Teacher,
                textButton: S.current.More,
              ),
              // const NoDataPage(),
            ])),
            //gridview
            SliverPadding(
              padding: const EdgeInsets.only(left: 5, right: 5, bottom: 12),
              sliver: ListRecommendedTeacher(
                size: size,
              ),
            ),
          ],
        ),
      );
    });
  }
}
