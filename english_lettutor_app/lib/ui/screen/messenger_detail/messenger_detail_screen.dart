import 'package:english_lettutor_app/models/messager/conversation.dart';
import 'package:english_lettutor_app/models/teacher/teacher.dart';
import 'package:english_lettutor_app/ui/screen/messenger_detail/components/messenger_detail_body.dart';
import 'package:flutter/material.dart';

import 'components/app_bar_messager_detail.dart';

class MessengerDetailScreen extends StatelessWidget {
  static String routeName = "/messenger_detail";
  const MessengerDetailScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarMessagerDetail(
        teacher: Teacher.getDefault(),
      ),
      body: MessengerDetailBody(
        conversation: Conversation.getDefault(),
      ),
    );
  }
}
