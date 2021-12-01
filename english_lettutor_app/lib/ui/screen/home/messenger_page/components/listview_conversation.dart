import 'package:auto_animated/auto_animated.dart';
import 'package:english_lettutor_app/models/messager/conversation.dart';
import 'package:english_lettutor_app/ui/widget/item_view/components/no_data_page.dart';
import 'package:flutter/material.dart';

import 'card_chat_item.dart';

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
      showItemInterval: const Duration(milliseconds: 30),
      showItemDuration: const Duration(milliseconds: 50),
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
      reAnimateOnVisibility: true,
    );
  }
}
