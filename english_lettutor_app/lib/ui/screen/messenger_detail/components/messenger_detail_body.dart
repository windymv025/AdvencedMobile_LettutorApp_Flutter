import 'package:auto_animated/auto_animated.dart';
import 'package:english_lettutor_app/models/conversation.dart';
import 'package:english_lettutor_app/models/message.dart';
import 'package:english_lettutor_app/ui/screen/messenger_detail/components/item_message_receiver.dart';
import 'package:english_lettutor_app/ui/screen/messenger_detail/components/item_message_sender.dart';
import 'package:english_lettutor_app/utilities/constants/constants.dart';
import 'package:flutter/material.dart';

class MessengerDetailBody extends StatefulWidget {
  const MessengerDetailBody({Key? key, required this.conversation})
      : super(key: key);
  final Conversation conversation;

  @override
  _MessengerDetailBodyState createState() => _MessengerDetailBodyState();
}

class _MessengerDetailBodyState extends State<MessengerDetailBody> {
  final ScrollController _scrollController = ScrollController();
  final TextEditingController _controller = TextEditingController();
  bool isSend = false;

  @override
  Widget build(BuildContext context) {
    List<Message> messages = widget.conversation.messages;
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width,
      height: size.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            child: LiveList(
              showItemInterval: const Duration(milliseconds: 30),
              showItemDuration: const Duration(milliseconds: 50),
              controller: _scrollController,
              reverse: true,
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 20),
              itemBuilder: (BuildContext context, int index,
                  Animation<double> animation) {
                final Message message = messages[messages.length - index - 1];
                bool isMe = message.id == 0;

                if (isMe) {
                  return FadeTransition(
                      opacity: Tween<double>(
                        begin: 0,
                        end: 1,
                      ).animate(animation),
                      child: ItemMessageSender(
                        size: size,
                        message: message,
                      ));
                } else {
                  return FadeTransition(
                      opacity: Tween<double>(
                        begin: 0,
                        end: 1,
                      ).animate(animation),
                      child: ItemMessageReceiver(
                        size: size,
                        message: message,
                      ));
                }
              },
              itemCount: widget.conversation.messages.length,
              reAnimateOnVisibility: true,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: const EdgeInsets.only(bottom: 5, left: 15, right: 15),
              constraints: const BoxConstraints(
                maxHeight: 150,
                minHeight: 80,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _controller,
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      textAlignVertical: TextAlignVertical.center,
                      onChanged: (value) {
                        setState(() {
                          if (value.isNotEmpty) {
                            isSend = true;
                          } else {
                            isSend = false;
                          }
                        });
                      },
                      onTap: scrollDDown,
                      decoration: InputDecoration(
                        hintText: "Type a message",
                        suffixIcon: IconButton(
                          icon: Icon(
                            Icons.send_rounded,
                            color: isSend ? kPrimaryColor : Colors.grey,
                          ),
                          onPressed: isSend
                              ? () {
                                  sendMessage();
                                }
                              : null,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  void scrollDDown() {
    setState(() {
      final double end = _scrollController.position.minScrollExtent;
      _scrollController.jumpTo(end);
    });
  }

  void sendMessage() {
    setState(() {
      //add message
      _controller.clear();
      isSend = false;
    });
  }
}
