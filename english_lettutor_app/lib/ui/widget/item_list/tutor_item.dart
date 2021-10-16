import 'package:english_lettutor_app/ui/widget/item_list/my_list_tile.dart';
import 'package:english_lettutor_app/ui/widget/item_view/rating.dart';
import 'package:english_lettutor_app/ui/widget/item_view/tag/tag.dart';
import 'package:english_lettutor_app/utilities/constants/styles.dart';
import 'package:flutter/material.dart';

class TutorItem extends StatefulWidget {
  const TutorItem(
      {Key? key,
      required this.avatar,
      required this.onTap,
      required this.name,
      required this.description,
      required this.tags,
      this.isFavorite = false})
      : super(key: key);
  final ImageProvider? avatar;
  final GestureTapCallback? onTap;
  final String name;
  final bool isFavorite;
  final String description;

  final List<String>? tags;

  @override
  _TutorItemState createState() => _TutorItemState();
}

class _TutorItemState extends State<TutorItem> {
  static final List<Icon> _listIcons = [
    const Icon(Icons.favorite_border, color: Colors.red),
    const Icon(Icons.favorite, color: Colors.red)
  ];

  var _icon = _listIcons[0];

  void onFavoriteClick() {
    setState(() {
      _icon = _icon == _listIcons[0] ? _listIcons[1] : _listIcons[0];
    });
  }

  List<Widget> generateListTags() {
    if (widget.tags == null) {
      return [];
    } else {
      List<Tag> tags = [];
      for (var i in widget.tags!) {
        tags.add(Tag(label: i));
      }
      return tags;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          MyListTile(
            avatar: widget.avatar,
            onTap: widget.onTap,
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.name,
                  style: titleStyle,
                ),
                Rating(
                  rating: 5,
                  onRatingUpdate: () {},
                ),
              ],
            ),
            subtitle: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: generateListTags(),
              ),
            ),
            trailing: IconButton(
              icon: _icon,
              onPressed: onFavoriteClick,
              iconSize: 30,
            ),
          ),
          SizedBox.fromSize(
            size: const Size.fromHeight(0),
          ),
          Container(
            child: Text(
              widget.description,
              overflow: TextOverflow.ellipsis,
              maxLines: 4,
              textAlign: TextAlign.justify,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
            ),
            padding:
                const EdgeInsets.only(left: 20, right: 20, top: 5, bottom: 15),
          )
        ],
      ),
    );
  }
}
