import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import '../models/chat_list_item.dart';

class ChatListTile extends StatelessWidget {
  final ChatListItem chat;
  final VoidCallback onTap;

  const ChatListTile({
    super.key,
    required this.chat,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(chat.name),
      direction: DismissDirection.endToStart,
      confirmDismiss: (direction) async {
        // Prevent actual dismissal, just show actions
        return false;
      },
      import 'package:flutter/material.dart';
      import 'package:flutter_slidable/flutter_slidable.dart';
      import '../models/chat_list_item.dart';

      class ChatListTile extends StatelessWidget {
        final ChatListItem chat;
        final VoidCallback onTap;

        const ChatListTile({
          super.key,
          required this.chat,
          required this.onTap,
        });

        @override
        Widget build(BuildContext context) {
          return Slidable(
            key: ValueKey('${chat.name}_${chat.time}'),
            endActionPane: ActionPane(
              motion: const DrawerMotion(),
              extentRatio: 0.60,
              children: [
                SlidableAction(
                  onPressed: (ctx) {
                    ScaffoldMessenger.of(ctx).showSnackBar(
                      SnackBar(content: Text('Call ${chat.name}')),
                    );
                  },
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                  icon: Icons.call,
                  label: 'Call',
                ),
                SlidableAction(
                  onPressed: (ctx) {
                    ScaffoldMessenger.of(ctx).showSnackBar(
                      SnackBar(content: Text('Video ${chat.name}')),
                    );
                  },
                  backgroundColor: Colors.indigo,
                  foregroundColor: Colors.white,
                  icon: Icons.videocam,
                  label: 'Video',
                ),
                SlidableAction(
                  onPressed: (ctx) {
                    ScaffoldMessenger.of(ctx).showSnackBar(
                      SnackBar(content: Text('Toggle notifications for ${chat.name}')),
                    );
                  },
                  backgroundColor: Colors.grey.shade700,
                  foregroundColor: Colors.white,
                  icon: Icons.notifications_off,
                  label: 'Mute',
                ),
                SlidableAction(
                  onPressed: (ctx) {
                    ScaffoldMessenger.of(ctx).showSnackBar(
                      SnackBar(content: Text('Delete ${chat.name}')),
                    );
                  },
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                  icon: Icons.delete,
                  label: 'Delete',
                ),
              ],
            ),
            child: InkWell(
              onTap: onTap,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Row(
                  children: [
                    // Avatar with story ring
                    Stack(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(3),
                          decoration: chat.hasStory
                              ? BoxDecoration(
                                  shape: BoxShape.circle,
                                  gradient: const LinearGradient(
                                    colors: [
                                      Color(0xFF9B4DFF),
                                      Color(0xFFFF6B9D),
                                    ],
                                  ),
                                )
                              : null,
                          child: Container(
                            padding: const EdgeInsets.all(3),
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                            child: CircleAvatar(
                              radius: 28,
                              backgroundColor: _getAvatarColor(chat.name),
                              backgroundImage: chat.avatarUrl.isNotEmpty
                                  ? NetworkImage(chat.avatarUrl)
                                  : null,
                              child: chat.avatarUrl.isEmpty
                                  ? Text(
                                      chat.name[0].toUpperCase(),
                                      style: const TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white,
                                      ),
                                    )
                                  : null,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 12),

                    // Chat info
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(
                                  chat.name,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: chat.isRead ? FontWeight.w600 : FontWeight.bold,
                                    color: Colors.black87,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Text(
                                chat.time,
                                style: TextStyle(
                                  fontSize: 12,
                                  color: chat.isRead ? Colors.grey : Colors.blue,
                                  fontWeight: chat.isRead ? FontWeight.normal : FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 4),
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  chat.message,
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: chat.isRead ? Colors.grey : Colors.black87,
                                    fontWeight: chat.isRead ? FontWeight.normal : FontWeight.w600,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              if (chat.unreadCount != null && chat.unreadCount! > 0)
                                Container(
                                  margin: const EdgeInsets.only(left: 8),
                                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                  decoration: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Text(
                                    chat.unreadCount.toString(),
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              if (!chat.isRead && chat.unreadCount == null)
                                Container(
                                  margin: const EdgeInsets.only(left: 8),
                                  width: 12,
                                  height: 12,
                                  decoration: const BoxDecoration(
                                    color: Colors.blue,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }

        void _showMoreOptions(BuildContext context) {
          showModalBottomSheet(
            context: context,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            builder: (context) => Container(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListTile(
                    leading: const Icon(Icons.volume_off),
                    title: const Text('Mute'),
                    onTap: () {
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('${chat.name} muted')),
                      );
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.archive),
                    title: const Text('Archive'),
                    onTap: () {
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('${chat.name} archived')),
                      );
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.mark_email_read),
                    title: const Text('Mark as read'),
                    onTap: () {
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Marked as read')),
                      );
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.block),
                    title: const Text('Block'),
                    onTap: () {
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('${chat.name} blocked')),
                      );
                    },
                  ),
                ],
              ),
            ),
          );
        }

        void _showDeleteConfirmation(BuildContext context) {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text('Delete Chat'),
              content: Text('Are you sure you want to delete this chat with ${chat.name}?'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Cancel'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Chat with ${chat.name} deleted')),
                    );
                  },
                  style: TextButton.styleFrom(foregroundColor: Colors.red),
                  child: const Text('Delete'),
                ),
              ],
            ),
          );
        }

        Color _getAvatarColor(String name) {
          final colors = [
            Colors.blue.shade400,
            Colors.green.shade400,
            Colors.orange.shade400,
            Colors.purple.shade400,
            Colors.pink.shade400,
            Colors.teal.shade400,
            Colors.red.shade400,
          ];
          return colors[name.length % colors.length];
        }
      }
              leading: const Icon(Icons.archive),
