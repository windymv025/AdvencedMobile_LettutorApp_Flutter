import 'package:english_lettutor_app/constants/assets.dart';
import 'package:english_lettutor_app/constants/constants.dart';
import 'package:english_lettutor_app/constants/enums.dart';
import 'package:english_lettutor_app/models/teacher/teacher.dart';
import 'package:english_lettutor_app/ui/screen/teacher_detail/teacher_detail_screen.dart';
import 'package:english_lettutor_app/ui/widget/item_view/button/circle_avatar_button.dart';
import 'package:flutter/material.dart';

class AppBarMessagerDetail extends StatefulWidget
    implements PreferredSizeWidget {
  const AppBarMessagerDetail({Key? key, required this.teacher})
      : super(key: key);
  final Teacher teacher;

  @override
  _AppBarMessagerDetailState createState() => _AppBarMessagerDetailState();

  @override
  Size get preferredSize => AppBar().preferredSize;
}

class _AppBarMessagerDetailState extends State<AppBarMessagerDetail> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: kMainBlueColor,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatarButton(
            image: const AssetImage(Assets.assetsImagesUserIcon),
            isOnline: true,
            onPressed: () {
              Navigator.pushNamed(context, TeacherDetailScreen.routeName);
            },
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  widget.teacher.name!,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  widget.teacher.isOnline! ? "Online" : "Offline",
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      fontStyle: FontStyle.italic),
                ),
              ],
            ),
          )
        ],
      ),
      actions: [
        PopupMenuButton(
          icon: const Icon(Icons.more_vert_rounded),
          onSelected: (value) {},
          itemBuilder: (context) {
            return [
              PopupMenuItem(
                value: MenuSettingMessage.delete,
                child: Row(
                  children: const [
                    Text("Delete"),
                    Icon(Icons.delete_forever_rounded, color: Colors.red)
                  ],
                ),
              )
            ];
          },
        ),
      ],
    );
  }
}
