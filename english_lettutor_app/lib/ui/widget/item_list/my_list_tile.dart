import 'package:english_lettutor_app/ui/widget/item_view/avatar/circle_avatar_button.dart';
import 'package:english_lettutor_app/utilities/constants.dart';
import 'package:flutter/material.dart';

class MyListTile extends StatefulWidget {
  const MyListTile({
    Key? key,
    required this.avatar,
    required this.title,
    required this.subtitle,
    required this.trailing,
    required this.onTap,
  }) : super(key: key);
  final ImageProvider? avatar;
  final Widget title;
  final Widget subtitle;
  final Widget? trailing;
  final GestureTapCallback? onTap;

  @override
  _MyListTileState createState() => _MyListTileState();
}

class _MyListTileState extends State<MyListTile> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: widget.onTap,
        child: Row(
          children: [
            CircleAvatarButton(
              image: widget.avatar,
              radius: 50,
            ),
            Expanded(
                child: Column(
              children: [widget.title, widget.subtitle],
            )),
            SizedBox(
              child: widget.trailing,
              height: 35,
            )
          ],
        ));
  }
}
