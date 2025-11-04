import 'package:flutter/material.dart';
import '../models/message.dart';
import '../widgets/message_bubble.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _messageController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  final List<Message> _messages = [];

  @override
  void initState() {
    super.initState();
    _loadSampleMessages();
  }

  void _loadSampleMessages() {
    final now = DateTime.now();
    _messages.addAll([
      Message(
        text: "Hey! How are you doing?",
        isSentByMe: false,
        timestamp: now.subtract(const Duration(minutes: 30)),
        sender: "Alice",
      ),
      Message(
        text: "I'm doing great! Thanks for asking 😊",
        isSentByMe: true,
        timestamp: now.subtract(const Duration(minutes: 29)),
        sender: "Me",
      ),
      Message(
        text: "That's wonderful! I wanted to ask about the Flutter project.",
        isSentByMe: false,
        timestamp: now.subtract(const Duration(minutes: 28)),
        sender: "Alice",
      ),
      Message(
        text: "Sure! What would you like to know?",
        isSentByMe: true,
        timestamp: now.subtract(const Duration(minutes: 27)),
        sender: "Me",
      ),
      Message(
        text: "How's the Chat UI Clone coming along?",
        isSentByMe: false,
        timestamp: now.subtract(const Duration(minutes: 25)),
        sender: "Alice",
      ),
      Message(
        text:
            "It's looking fantastic! I've implemented ListView, dynamic message bubbles, and scrolling functionality.",
        isSentByMe: true,
        timestamp: now.subtract(const Duration(minutes: 24)),
        sender: "Me",
      ),
      Message(
        text: "That sounds amazing! Can't wait to see it in action. 🚀",
        isSentByMe: false,
        timestamp: now.subtract(const Duration(minutes: 20)),
        sender: "Alice",
      ),
      Message(
        text:
            "Thanks! The UI uses Row, Column, and Container widgets for complex layouts.",
        isSentByMe: true,
        timestamp: now.subtract(const Duration(minutes: 15)),
        sender: "Me",
      ),
      Message(
        text: "Are you using Material Design 3?",
        isSentByMe: false,
        timestamp: now.subtract(const Duration(minutes: 10)),
        sender: "Alice",
      ),
      Message(
        text: "Yes! Material 3 makes it look modern and polished. 💎",
        isSentByMe: true,
        timestamp: now.subtract(const Duration(minutes: 8)),
        sender: "Me",
      ),
      Message(
        text: "Perfect! Let me know when you're ready to add more features.",
        isSentByMe: false,
        timestamp: now.subtract(const Duration(minutes: 5)),
        sender: "Alice",
      ),
    ]);
  }

  void _sendMessage() {
    if (_messageController.text.trim().isEmpty) return;

    setState(() {
      _messages.add(
        Message(
          text: _messageController.text,
          isSentByMe: true,
          timestamp: DateTime.now(),
          sender: "Me",
        ),
      );
      _messageController.clear();
    });

    // Auto-scroll to bottom after sending message
    Future.delayed(const Duration(milliseconds: 100), () {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  void dispose() {
    _messageController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Row(
          children: [
            const SizedBox(width: 8),
            CircleAvatar(
              radius: 18,
              backgroundColor: Colors.blue.shade200,
              child: const Text(
                'A',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Alice',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Online',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.videocam),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.call),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          // Messages ListView
          Expanded(
            child: Container(
              color: Colors.grey.shade100,
              child: ListView.builder(
                controller: _scrollController,
                padding: const EdgeInsets.symmetric(vertical: 16),
                itemCount: _messages.length,
                itemBuilder: (context, index) {
                  return MessageBubble(message: _messages[index]);
                },
              ),
            ),
          ),

          // Message Input Area
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 4,
                  offset: const Offset(0, -2),
                ),
              ],
            ),
            child: SafeArea(
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.add_circle,
                      color: Colors.blue.shade500,
                      size: 28,
                    ),
                    onPressed: () {},
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: _messageController,
                              decoration: const InputDecoration(
                                hintText: 'Type a message...',
                                border: InputBorder.none,
                              ),
                              textCapitalization: TextCapitalization.sentences,
                              onSubmitted: (_) => _sendMessage(),
                            ),
                          ),
                          IconButton(
                            icon: const Icon(
                              Icons.emoji_emotions_outlined,
                              color: Colors.grey,
                            ),
                            onPressed: () {},
                            padding: EdgeInsets.zero,
                            constraints: const BoxConstraints(),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  CircleAvatar(
                    backgroundColor: Colors.blue.shade500,
                    child: IconButton(
                      icon: const Icon(
                        Icons.send,
                        color: Colors.white,
                        size: 20,
                      ),
                      onPressed: _sendMessage,
                      padding: EdgeInsets.zero,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
