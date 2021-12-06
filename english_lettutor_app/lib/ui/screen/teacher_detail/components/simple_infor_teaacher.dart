import 'package:english_lettutor_app/constants/assets.dart';
import 'package:english_lettutor_app/constants/design/styles.dart';
import 'package:english_lettutor_app/data/provider/teacher_dto.dart';
import 'package:english_lettutor_app/models/teacher/teacher.dart';
import 'package:english_lettutor_app/ui/widget/item_list/my_list_tile.dart';
import 'package:english_lettutor_app/ui/widget/item_view/components/rating.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';

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
    TeacherDTO teacherDTO = context.watch<TeacherDTO>();
    _icon = teacher.isFavorite ? _listIcons[1] : _listIcons[0];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: MyListTile(
          avatar: AssetImage(teacher.uriImage ?? Assets.assetsImagesUserIcon),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                teacher.name!,
                style: titleStyle,
                overflow: TextOverflow.clip,
              ),
              Text(widget.teacher.country,
                  style: const TextStyle(
                      fontSize: 14, fontStyle: FontStyle.italic)),
            ],
          ),
          subtitle: Rating(
            rating: teacher.ratings ?? 0,
            onRatingUpdate: () {},
          ),
          trailing: IconButton(
            icon: _icon,
            onPressed: () {
              onFavoriteClick();
              teacherDTO.updateFavorite(teacher);
            },
            iconSize: 30,
          ),
          onTap: null,
          color: Colors.white),
    );
  }
}
