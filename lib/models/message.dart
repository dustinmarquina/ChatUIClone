class Message {
  final String text;
  final bool isSentByMe;
  final DateTime timestamp;
  final String sender;

  Message({
    required this.text,
    required this.isSentByMe,
    required this.timestamp,
    required this.sender,
  });
}
