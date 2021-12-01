import 'package:english_lettutor_app/models/messager/conversation.dart';
import 'package:english_lettutor_app/ui/widget/item_view/bar/search_bar_title.dart';
import 'package:flutter/material.dart';

import 'components/listview_conversation.dart';

class MessengerBody extends StatefulWidget {
  const MessengerBody({Key? key}) : super(key: key);

  @override
  _MessengerBodyState createState() => _MessengerBodyState();
}

class _MessengerBodyState extends State<MessengerBody> {
  List<Conversation> conversations = [];
  @override
  Widget build(BuildContext context) {
    loadListConversation();
    Size size = MediaQuery.of(context).size;

    return CustomScrollView(
      slivers: [
        SliverList(
            delegate: SliverChildListDelegate([
          SearchBarTitle(size: size),
          const SizedBox(
            height: 10,
          ),
        ])),
        ListviewConversation(conversations: conversations),
        SliverList(
            delegate: SliverChildListDelegate([
          const SizedBox(
            height: 0,
          ),
        ])),
      ],
    );
  }

  loadListConversation() {
    conversations.add(Conversation.getDefault());
    conversations.add(Conversation.getDefault());
    conversations.add(Conversation.getDefault());
    conversations.add(Conversation.getDefault());
    conversations.add(Conversation.getDefault());
    conversations.add(Conversation.getDefault());
    conversations.add(Conversation.getDefault());
    conversations.add(Conversation.getDefault());
    conversations.add(Conversation.getDefault());
    conversations.add(Conversation.getDefault());
    conversations.add(Conversation.getDefault());
    conversations.add(Conversation.getDefault());
    conversations.add(Conversation.getDefault());
    conversations.add(Conversation.getDefault());
    conversations.add(Conversation.getDefault());
    conversations.add(Conversation.getDefault());
  }
}
