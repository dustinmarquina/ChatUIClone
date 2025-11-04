// Sample code snippets for reference

// 1. ListView with ScrollController
ListView.builder(
  controller: _scrollController,
  padding: const EdgeInsets.symmetric(vertical: 16),
  itemCount: _messages.length,
  itemBuilder: (context, index) {
    return MessageBubble(message: _messages[index]);
  },
)

// 2. Dynamic Container Styling
Container(
  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
  decoration: BoxDecoration(
    color: message.isSentByMe ? Colors.blue.shade500 : Colors.grey.shade300,
    borderRadius: BorderRadius.only(
      topLeft: const Radius.circular(16),
      topRight: const Radius.circular(16),
      bottomLeft: message.isSentByMe ? const Radius.circular(16) : const Radius.circular(4),
      bottomRight: message.isSentByMe ? const Radius.circular(4) : const Radius.circular(16),
    ),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.1),
        blurRadius: 4,
        offset: const Offset(0, 2),
      ),
    ],
  ),
  child: Column(/* ... */),
)

// 3. Row with Flexible Widget
Row(
  mainAxisAlignment: message.isSentByMe ? MainAxisAlignment.end : MainAxisAlignment.start,
  crossAxisAlignment: CrossAxisAlignment.end,
  children: [
    if (!message.isSentByMe) CircleAvatar(/* ... */),
    const SizedBox(width: 8),
    Flexible(child: Container(/* message bubble */)),
    const SizedBox(width: 8),
    if (message.isSentByMe) CircleAvatar(/* ... */),
  ],
)

// 4. Auto-scroll Implementation
void _sendMessage() {
  if (_messageController.text.trim().isEmpty) return;
  
  setState(() {
    _messages.add(Message(/* ... */));
    _messageController.clear();
  });
  
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

// 5. TextField with Custom Decoration
TextField(
  controller: _messageController,
  decoration: const InputDecoration(
    hintText: 'Type a message...',
    border: InputBorder.none,
  ),
  textCapitalization: TextCapitalization.sentences,
  onSubmitted: (_) => _sendMessage(),
)

// 6. Conditional Widget Rendering
if (!message.isSentByMe)
  Padding(
    padding: const EdgeInsets.only(bottom: 4),
    child: Text(
      message.sender,
      style: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.bold,
        color: Colors.blue.shade700,
      ),
    ),
  ),

// 7. Date Formatting
import 'package:intl/intl.dart';

final timeFormat = DateFormat('HH:mm');
Text(timeFormat.format(message.timestamp))

// 8. StatefulWidget Lifecycle
@override
void initState() {
  super.initState();
  _loadSampleMessages();
}

@override
void dispose() {
  _messageController.dispose();
  _scrollController.dispose();
  super.dispose();
}

// 9. Material 3 Theme Setup
ThemeData(
  primarySwatch: Colors.blue,
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.blue,
    brightness: Brightness.light,
  ),
  useMaterial3: true,
)

// 10. SafeArea for Input Field
SafeArea(
  child: Row(
    children: [
      IconButton(/* ... */),
      Expanded(child: TextField(/* ... */)),
      CircleAvatar(/* send button */),
    ],
  ),
)
