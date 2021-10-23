import 'package:english_lettutor_app/models/teacher.dart';
import 'package:english_lettutor_app/ui/widget/item_list/my_list_tile.dart';
import 'package:english_lettutor_app/ui/widget/item_view/components/rating.dart';
import 'package:english_lettutor_app/utilities/design/styles.dart';
import 'package:flutter/material.dart';

class SimpleInforTeacher extends StatefulWidget {
  const SimpleInforTeacher({Key? key, required this.teacher}) : super(key: key);
  final Teacher teacher;
  @override
  _SimpleInforTeacherState createState() => _SimpleInforTeacherState();
}

class _SimpleInforTeacherState extends State<SimpleInforTeacher> {
  static final List<Icon> _listIcons = [
    const Icon(Icons.favorite_border_rounded, color: Colors.red),
    const Icon(Icons.favorite_rounded, color: Colors.red)
  ];

  var _icon = _listIcons[0];

  void onFavoriteClick() {
    setState(() {
      _icon = _icon == _listIcons[0] ? _listIcons[1] : _listIcons[0];
    });
  }

  @override
  Widget build(BuildContext context) {
    Teacher teacher = widget.teacher;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: MyListTile(
          avatar: AssetImage(teacher.uriImage!),
          title: Text(
            teacher.name!,
            style: titleStyle,
          ),
          subtitle: Rating(
            rating: teacher.ratings!,
            onRatingUpdate: () {},
          ),
          trailing: IconButton(
            icon: _icon,
            onPressed: onFavoriteClick,
            iconSize: 30,
          ),
          onTap: null,
          color: Colors.white),
    );
  }
}
