import 'package:flutter/material.dart';
import 'screens/chats_list_screen.dart';

void main() {
  runApp(const ChatUICloneApp());
}

class ChatUICloneApp extends StatelessWidget {
  const ChatUICloneApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chat UI Clone',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          brightness: Brightness.light,
        ),
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 0,
        ),
      ),
      home: const ChatsListScreen(),
    );
  }
}
