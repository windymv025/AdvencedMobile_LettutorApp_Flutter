import 'package:english_lettutor_app/ui/screen/home/components/custom_grid_view.dart';
import 'package:english_lettutor_app/ui/screen/home/components/responsive_layout.dart';
import 'package:english_lettutor_app/ui/widget/item_list/tutor_item.dart';
import 'package:english_lettutor_app/ui/widget/item_view/search_bar.dart';
import 'package:english_lettutor_app/utilities/constants/constants.dart';
import 'package:english_lettutor_app/utilities/constants/styles.dart';
import 'package:flutter/material.dart';

class TeacherPage extends StatefulWidget {
  const TeacherPage({Key? key}) : super(key: key);

  @override
  TeacherPageState createState() => TeacherPageState();
}

class TeacherPageState extends State<TeacherPage> {
  final teachers = [
    const TutorItem(
      avatar: AssetImage("assets/images/no_data_found.png"),
      rating: 3,
      onTap: null,
      name: "Phạm Minh Vương",
      description:
          "Good Teacher asds hdka jhsdk ajdaksj dka jdskj ass kjsa hs kajhd kj sah dakjsd hsa khs sdsjk sdbbajs isuhdsai iusahds ishdians iuahsand auidsk iujsn oisjdn kjand ksabndfsj sandkj sdj",
      tags: ["English", "ABC", "GTHK"],
    ),
    const TutorItem(
      avatar: AssetImage("assets/images/no_data_found.png"),
      rating: 5,
      onTap: null,
      name:
          "Phạm Minh Vương widy pro vip strong froc frod product group facevbook manhj me",
      description:
          "Good Teacher asds hdka jhsdk ajdaksj dka jdskj ass kjsa hs kajhd kj sah dakjsd hsa khs sdsjk sdbbajs isuhdsai iusahds ishdians iuahsand auidsk iujsn oisjdn kjand ksabndfsj sandkj sdj",
      tags: ["English", "ABC", "GTHK"],
    ),
    const TutorItem(
      rating: 2,
      avatar: AssetImage("assets/images/no_data_found.png"),
      onTap: null,
      name: "Phạm Minh Vương",
      description: "Good Teacher asds hdka jhsdk ajdaksj dka jdskj",
      tags: ["English", "ABC", "GTHK"],
    ),
    const TutorItem(
      rating: 3.5,
      avatar: AssetImage("assets/images/no_data_found.png"),
      onTap: null,
      name: "Phạm Minh Vương",
      description:
          "Good Teacher asds hdka jhsdk ajdaksj dka jdskj ass kjsa hs kajhd kj sah dakjsd hsa khs sdsjk sdbbajs isuhdsai iusahds ishdians iuahsand auidsk iujsn oisjdn kjand ksabndfsj sandkj sdj",
      tags: ["English", "ABC", "GTHK"],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    int columRatio = 12;
    return LayoutBuilder(
      builder: (context, dimens) {
        if (dimens.maxWidth <= kMobileBreakpoint) {
          columRatio = 12;
        } else if (dimens.maxWidth > kMobileBreakpoint &&
            dimens.maxWidth <= kTabletBreakpoint) {
          columRatio = 6;
        } else if (dimens.maxWidth > kTabletBreakpoint &&
            dimens.maxWidth <= kDesktopBreakPoint) {
          columRatio = 4;
        } else {
          columRatio = 3;
        }
        return Column(
          children: [
            SizedBox(
              height: 40,
              child: Stack(
                children: [
                  Container(
                    padding:
                        const EdgeInsets.only(left: 25, right: 25, bottom: 20),
                    height: 40 - 27,
                    decoration: const BoxDecoration(
                      color: kMainBlueColor,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(36),
                        bottomRight: Radius.circular(36),
                      ),
                    ),
                    child: const SizedBox.shrink(),
                  ),
                  Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: SearchBar(
                        onIconPressed: () {
                          setState(() {});
                        },
                        onTextChanged: (value) {
                          setState(() {});
                        },
                      )),
                ],
              ),
            ),
            Flexible(
              child: CustomGridView(
                columnRatio: columRatio,
                items: teachers,
              ),
            ),
          ],
        );
      },
    );
  }
}
