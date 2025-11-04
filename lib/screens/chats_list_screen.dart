import 'package:flutter/material.dart';
import '../models/chat_list_item.dart';
import '../widgets/chat_list_tile.dart';
import 'chat_screen.dart';

class ChatsListScreen extends StatefulWidget {
  const ChatsListScreen({super.key});

  @override
  State<ChatsListScreen> createState() => _ChatsListScreenState();
}

class _ChatsListScreenState extends State<ChatsListScreen> {
  final List<ChatListItem> _chats = [];
  final List<Map<String, String>> _stories = [];

  @override
  void initState() {
    super.initState();
    _loadChatsData();
    _loadStoriesData();
  }

  void _loadStoriesData() {
    _stories.addAll([
      {'name': 'Your story', 'avatar': ''},
      {'name': 'Joshua', 'avatar': ''},
      {'name': 'Martin', 'avatar': ''},
      {'name': 'Karen', 'avatar': ''},
      {'name': 'Nash', 'avatar': ''},
    ]);
  }

  void _loadChatsData() {
    _chats.addAll([
      ChatListItem(
        name: 'Martin Randolph',
        message: "You: What's man! · 9:40 AM",
        time: '9:40 AM',
        avatarUrl: '',
        hasStory: true,
        isRead: true,
      ),
      ChatListItem(
        name: 'Andrew Parker',
        message: 'You: Ok, thanks! · 9:25 AM',
        time: '9:25 AM',
        avatarUrl: '',
        hasStory: false,
        isRead: true,
      ),
      ChatListItem(
        name: 'Karen Castillo',
        message: 'Wow, this is really epic · Fri',
        time: 'Fri',
        avatarUrl: '',
        hasStory: true,
        isRead: false,
      ),
      ChatListItem(
        name: 'Maisy Humphrey',
        message: 'Have a good day, Maisy! · Fri',
        time: 'Fri',
        avatarUrl: '',
        hasStory: false,
        isRead: true,
      ),
      ChatListItem(
        name: 'Joshua Lawrence',
        message: 'The business plan loo... · Thu',
        time: 'Thu',
        avatarUrl: '',
        hasStory: true,
        isRead: true,
      ),
      ChatListItem(
        name: 'Pixsellz 📱',
        message: 'Make design process easier...',
        time: 'Wed',
        avatarUrl: '',
        hasStory: false,
        isRead: true,
      ),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          children: [
            CircleAvatar(
              radius: 18,
              backgroundColor: Colors.grey.shade300,
              child: const Icon(Icons.person, color: Colors.grey, size: 20),
            ),
            const SizedBox(width: 12),
            const Text(
              'Chats',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.camera_alt, color: Colors.black),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.edit_square, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          // Search bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Row(
                children: [
                  Icon(Icons.search, color: Colors.grey, size: 20),
                  SizedBox(width: 8),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search',
                        border: InputBorder.none,
                        hintStyle: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Stories section
          SizedBox(
            height: 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 8),
              itemCount: _stories.length,
              itemBuilder: (context, index) {
                final story = _stories[index];
                final isYourStory = index == 0;
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              gradient: !isYourStory
                                  ? const LinearGradient(
                                      colors: [
                                        Color(0xFF9B4DFF),
                                        Color(0xFFFF6B9D),
                                      ],
                                    )
                                  : null,
                              border: isYourStory
                                  ? Border.all(
                                      color: Colors.grey.shade300,
                                      width: 2,
                                    )
                                  : null,
                            ),
                            padding: const EdgeInsets.all(3),
                            child: CircleAvatar(
                              radius: 28,
                              backgroundColor: _getAvatarColor(story['name']!),
                              child: Text(
                                story['name']![0].toUpperCase(),
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          if (isYourStory)
                            Positioned(
                              right: 0,
                              bottom: 0,
                              child: Container(
                                padding: const EdgeInsets.all(2),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: Colors.white,
                                    width: 2,
                                  ),
                                ),
                                child: Container(
                                  padding: const EdgeInsets.all(4),
                                  decoration: const BoxDecoration(
                                    color: Colors.blue,
                                    shape: BoxShape.circle,
                                  ),
                                  child: const Icon(
                                    Icons.add,
                                    size: 12,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      SizedBox(
                        width: 70,
                        child: Text(
                          story['name']!,
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.black87,
                          ),
                          textAlign: TextAlign.center,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),

          const Divider(height: 1),

          // Chats list
          Expanded(
            child: ListView.builder(
              itemCount: _chats.length,
              itemBuilder: (context, index) {
                return ChatListTile(
                  chat: _chats[index],
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ChatScreen(),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: 0,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble, size: 28),
            label: 'Chats',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people, size: 28),
            label: 'People',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.circle_outlined, size: 28),
            label: 'Stories',
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
