import 'package:english_lettutor_app/ui/widget/item_list/tutor_item.dart';
import 'package:english_lettutor_app/utilities/constants.dart';
import 'package:english_lettutor_app/utilities/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _listItem = <Widget>[
    const TutorItem(
      avatar: AssetImage("assets/images/no_data_found.png"),
      onTap: null,
      name: "Phạm Minh Vương",
      description:
          "Good Teacher asds hdka jhsdk ajdaksj dka jdskj ass kjsa hs kajhd kj sah dakjsd hsa khs sdsjk sdbbajs isuhdsai iusahds ishdians iuahsand auidsk iujsn oisjdn kjand ksabndfsj sandkj sdj",
      tags: ["English", "ABC", "GTHK"],
    ),
    const TutorItem(
      avatar: AssetImage("assets/images/no_data_found.png"),
      onTap: null,
      name: "Phạm Minh Vương",
      description:
          "Good Teacher asds hdka jhsdk ajdaksj dka jdskj ass kjsa hs kajhd kj sah dakjsd hsa khs sdsjk sdbbajs isuhdsai iusahds ishdians iuahsand auidsk iujsn oisjdn kjand ksabndfsj sandkj sdj",
      tags: ["English", "ABC", "GTHK"],
    ),
    const TutorItem(
      avatar: AssetImage("assets/images/no_data_found.png"),
      onTap: null,
      name: "Phạm Minh Vương",
      description:
          "Good Teacher asds hdka jhsdk ajdaksj dka jdskj ass kjsa hs kajhd kj sah dakjsd hsa khs sdsjk sdbbajs isuhdsai iusahds ishdians iuahsand auidsk iujsn oisjdn kjand ksabndfsj sandkj sdj",
      tags: ["English", "ABC", "GTHK"],
    ),
    const TutorItem(
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
    return SingleChildScrollView(
      child: Column(
        children: [
          // welcome
          Container(
            height: 200,
            color: Colors.blue,
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Welcome to English LetTutor App!",
                    style: Styles.tileCountDownStyle,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    style: Styles.outlineButtonStyle,
                    onPressed: () {},
                    child: const Text(
                      'Booking now',
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: Constants.textSizeButton),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          // see all
          Container(
              padding: const EdgeInsets.all(5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  // Expanded(child:
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: const [
                      Text(
                        "Recommended Tutors",
                        style: Styles.titleStyle,
                      ),
                      SizedBox(
                        width: 165,
                        child: Divider(
                          thickness: 2,
                          color: Colors.black38,
                        ),
                      ),
                    ],
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text("See all >>"),
                    style: Styles.textButtonStyle,
                  )
                ],
              )),
          //listview
          Container(
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
            child: Column(
              children: _listItem,
            ),
          )
          // const NoDataPage(),
        ],
      ),
    );
  }
}
