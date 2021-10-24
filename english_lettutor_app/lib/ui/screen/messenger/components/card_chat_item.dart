import 'package:english_lettutor_app/models/conversation.dart';
import 'package:english_lettutor_app/models/message.dart';
import 'package:english_lettutor_app/models/teacher.dart';
import 'package:english_lettutor_app/ui/screen/messenger_detail/messenger_detail_screen.dart';
import 'package:english_lettutor_app/ui/widget/item_view/button/circle_avatar_button.dart';
import 'package:english_lettutor_app/utilities/constants/constants.dart';
import 'package:english_lettutor_app/utilities/constants/enums.dart';
import 'package:english_lettutor_app/utilities/helper/function_helper.dart';
import 'package:flutter/material.dart';
import 'package:english_lettutor_app/utilities/design/styles.dart';

class CardChatItem extends StatefulWidget {
  const CardChatItem({Key? key, required this.conversation}) : super(key: key);
  final Conversation conversation;

  @override
  _CardChatItemState createState() => _CardChatItemState();
}

class _CardChatItemState extends State<CardChatItem> {
  @override
  Widget build(BuildContext context) {
    Teacher teacher = widget.conversation.teacher;
    Message lastMessage = widget.conversation.messages.last;
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, MessengerDetailScreen.routeName);
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              blurRadius: 10,
              color: kPrimaryColor.withOpacity(0.10),
            ),
          ],
        ),
        child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: ListTile(
              leading: CircleAvatarButton(
                image: AssetImage(teacher.uriImage!),
              ),
              title: Text(
                widget.conversation.teacher.name!,
                style: titleStyle,
              ),
              subtitle: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Text(
                      lastMessage.message,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Text("$dot${getStringTime(lastMessage.time)}")
                ],
              ),
              trailing: PopupMenuButton(
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
            )),
      ),
    );
  }
}
