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
    return Container(
      padding: const EdgeInsets.only(top: 15, bottom: 10),
      child: GestureDetector(
          onTap: widget.onTap,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                  backgroundImage: widget.avatar!,
                  backgroundColor: Colors.white,
                  radius: 40,
                ),
              ),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [widget.title, widget.subtitle],
              )),
              Container(
                child: widget.trailing,
              ),
            ],
          )),
    );
  }
}
