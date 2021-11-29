class Message {
  late int id;
  late String message;
  late DateTime time;

  Message({required this.id, required this.message, required this.time});
  Message.getDefaultReceiver() {
    message = "Hi you! Nice to meet you! I'm Windy. I'm pro english.";
    time = DateTime.now();
    id = 1;
  }
  Message.getDefaultSender() {
    message = "Hi you! Nice to meet you! I'm Windy. I'm pro english.";
    time = DateTime.now();
    id = 0;
  }
}
