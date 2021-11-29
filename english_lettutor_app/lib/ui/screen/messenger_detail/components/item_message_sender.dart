import 'package:english_lettutor_app/constants/constants.dart';
import 'package:english_lettutor_app/constants/helper/function_helper.dart';
import 'package:english_lettutor_app/models/messager/message.dart';
import 'package:flutter/material.dart';

class ItemMessageSender extends StatelessWidget {
  const ItemMessageSender({Key? key, required this.message, required this.size})
      : super(key: key);
  final Message message;
  final Size size;
  @override
  Widget build(BuildContext context) {
    Color color = kMainBlueColor;
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        constraints: BoxConstraints(maxWidth: size.width * 0.6, minWidth: 120),
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          color: color,
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    left: 10, right: 40, top: 10, bottom: 30),
                child: Text(
                  message.message,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
              Positioned(
                bottom: 10,
                right: 7,
                child: Row(
                  children: [
                    Text(
                      getStringTime(message.time),
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 11,
                          fontStyle: FontStyle.italic),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    const Icon(
                      Icons.check_circle,
                      color: Colors.white,
                      size: 14,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
