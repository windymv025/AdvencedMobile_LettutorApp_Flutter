import 'package:auto_animated/auto_animated.dart';
import 'package:english_lettutor_app/models/conversation.dart';
import 'package:english_lettutor_app/ui/screen/messenger/components/card_chat_item.dart';
import 'package:english_lettutor_app/ui/widget/item_view/components/no_data_page.dart';
import 'package:flutter/material.dart';

class ListviewConversation extends StatelessWidget {
  const ListviewConversation({Key? key, required this.conversations})
      : super(key: key);
  final List<Conversation> conversations;
  @override
  Widget build(BuildContext context) {
    if (conversations.isEmpty) {
      return const NoDataPage();
    }

    return LiveSliverList(
      controller: ScrollController(),
      showItemInterval: const Duration(milliseconds: 250),
      showItemDuration: const Duration(milliseconds: 300),
      itemCount: conversations.length,
      itemBuilder: (context, index, animation) {
        return FadeTransition(
          opacity: Tween<double>(
            begin: 0,
            end: 1,
          ).animate(animation),
          child: CardChatItem(conversation: conversations[index]),
        );
      },
    );
  }
}