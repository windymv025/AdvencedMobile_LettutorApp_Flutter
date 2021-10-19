import 'package:english_lettutor_app/ui/widget/item_list/tutor_item.dart';
import 'package:flutter/material.dart';

class ListRecommendedTeacher extends StatefulWidget {
  const ListRecommendedTeacher({Key? key}) : super(key: key);

  @override
  _ListRecommendedTeacherState createState() => _ListRecommendedTeacherState();
}

class _ListRecommendedTeacherState extends State<ListRecommendedTeacher> {
  final _listItem = [
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
    return Container(
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
      child: Column(
        children: _listItem,
      ),
    );
  }
}
