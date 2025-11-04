class ChatListItem {
  final String name;
  final String message;
  final String time;
  final String avatarUrl;
  final bool hasStory;
  final bool isRead;
  final int? unreadCount;

  ChatListItem({
    required this.name,
    required this.message,
    required this.time,
    required this.avatarUrl,
    this.hasStory = false,
    this.isRead = true,
    this.unreadCount,
  });
}
