import 'package:english_lettutor_app/models/messager/message.dart';
import 'package:english_lettutor_app/models/teacher/teacher.dart';

class Conversation {
  late Teacher teacher;
  List<Message> messages = [];
  Conversation({required this.messages, required this.teacher});

  Conversation.getDefault() {
    // teacher = Teacher.getDefault();
    messages.add(Message(
        id: 0, message: "hi", time: DateTime(2021, 10, 22, 15, 10, 50)));
    messages.add(Message(
        id: 1, message: "hello", time: DateTime(2021, 10, 23, 15, 15, 50)));
    messages.add(Message(
        id: 1,
        message: "nice to meet you",
        time: DateTime(2021, 10, 23, 15, 20, 50)));
    messages.add(Message(
        id: 0,
        message: "you so cute",
        time: DateTime(2021, 10, 23, 15, 25, 50)));
    messages.add(Message(
        id: 0, message: "ready???", time: DateTime(2021, 10, 23, 15, 30, 50)));
    messages.add(Message(
        id: 1,
        message:
            "What are you going tonight? Have you free time for me? I want to tell you about a important story.",
        time: DateTime(2021, 10, 23, 15, 35, 50)));
    messages.add(Message(
        id: 1,
        message: "nice to meet you",
        time: DateTime(2021, 10, 23, 15, 50, 50)));
    messages.add(Message(
        id: 0,
        message: "you so cute",
        time: DateTime(2021, 10, 23, 15, 55, 50)));
    messages.add(Message(
        id: 1,
        message:
            "What are you going tonight? Have you free time for me? I want to tell you about a important story.",
        time: DateTime(2021, 10, 23, 16, 35, 50)));
    messages.add(Message(
        id: 1,
        message: "nice to meet you",
        time: DateTime(2021, 10, 23, 16, 50, 50)));
    messages.add(Message(
        id: 0,
        message: "you so cute",
        time: DateTime(2021, 10, 23, 16, 55, 50)));
    messages.add(Message(
        id: 1,
        message:
            "What are you going tonight? Have you free time for me? I want to tell you about a important story.",
        time: DateTime(2021, 10, 23, 17, 35, 50)));
    messages.add(Message(
        id: 1,
        message: "nice to meet you",
        time: DateTime(2021, 10, 23, 17, 50, 50)));
    messages.add(Message(
        id: 0,
        message: "you so cute",
        time: DateTime(2021, 10, 23, 17, 55, 50)));
    messages.add(Message(
        id: 1,
        message:
            "What are you going tonight? Have you free time for me? I want to tell you about a important story.",
        time: DateTime(2021, 10, 23, 17, 35, 50)));
  }
}
