import 'package:english_lettutor_app/constants/constants.dart';
import 'package:english_lettutor_app/constants/design/styles.dart';
import 'package:english_lettutor_app/data/provider/teacher_dto.dart';
import 'package:english_lettutor_app/models/teacher/teacher.dart';
import 'package:english_lettutor_app/ui/screen/teacher_detail/teacher_detail_screen.dart';
import 'package:english_lettutor_app/ui/widget/item_list/my_list_tile.dart';
import 'package:english_lettutor_app/ui/widget/item_view/components/rating.dart';
import 'package:english_lettutor_app/ui/widget/item_view/components/tag.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TutorItem extends StatefulWidget {
  const TutorItem({
    Key? key,
    required this.teacher,
  }) : super(key: key);

  final Teacher teacher;

  @override
  _TutorItemState createState() => _TutorItemState();
}

class _TutorItemState extends State<TutorItem> {
  static final List<Icon> _listIcons = [
    const Icon(Icons.favorite_border_rounded, color: Colors.red),
    const Icon(Icons.favorite_rounded, color: Colors.red)
  ];
  late TeacherDTO _teacherDTO;
  var _icon = _listIcons[0];

  void onFavoriteClick() {
    setState(() {
      _icon = _icon == _listIcons[0] ? _listIcons[1] : _listIcons[0];
      _teacherDTO.updateFavorite(widget.teacher);
    });
  }

  List<Widget> generateListTags() {
    if (widget.teacher.specialties == null) {
      return [];
    } else {
      List<Tag> tags = [];
      for (var i in widget.teacher.specialties!) {
        tags.add(Tag(label: i));
      }
      return tags;
    }
  }

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    _icon = widget.teacher.isFavorite ? _listIcons[1] : _listIcons[0];
    _teacherDTO = Provider.of<TeacherDTO>(context);
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, TeacherDetailScreen.routeName);
      },
      child: Container(
        decoration: BoxDecoration(
          boxShadow: isDark
              ? null
              : [
                  BoxShadow(
                    blurRadius: 5,
                    color: kPrimaryColor.withOpacity(0.25),
                  ),
                ],
        ),
        child: Card(
          child: Column(
            children: [
              MyListTile(
                // color: kCardColor,
                color: Colors.white,
                avatar: widget.teacher.uriImage != null
                    ? AssetImage(widget.teacher.uriImage!)
                    : null,
                onTap: null,
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.teacher.name!,
                      style: titleStyle,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                    Text(widget.teacher.country,
                        style: const TextStyle(
                            fontSize: 14, fontStyle: FontStyle.italic)),
                    Rating(
                      rating: widget.teacher.ratings!,
                      onRatingUpdate: () {},
                    ),
                  ],
                ),
                subtitle: Wrap(
                  children: generateListTags(),
                ),
                trailing: IconButton(
                  icon: _icon,
                  onPressed: onFavoriteClick,
                  iconSize: 30,
                ),
              ),
              const Divider(
                endIndent: 5,
                indent: 5,
                height: 3,
                color: kPrimaryColor,
              ),
              Container(
                child: Text(
                  widget.teacher.description!,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 4,
                  // textAlign: TextAlign.justify,
                  style: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.w400),
                ),
                padding: const EdgeInsets.only(
                    left: 20, right: 20, top: 5, bottom: 15),
              )
            ],
          ),
        ),
      ),
    );
  }
}
