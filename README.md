# Chat UI Clone

A Flutter project demonstrating complex layouts with scrolling functionality, similar to popular messaging apps like WhatsApp and Messenger.

## Features

- **Dynamic Message Bubbles**: Differentiated UI for sent and received messages
- **Scrolling ListView**: Smooth scrolling through message history
- **Complex Layouts**: Using Row, Column, and Container widgets
- **Modern UI**: Material Design 3 with custom styling
- **Avatar Display**: User avatars for message senders
- **Timestamp Display**: Shows message time in HH:mm format
- **Input Field**: Text input with send button and emoji icon
- **AppBar Actions**: Video call, voice call, and menu options

## Technical Stack

- **Flutter Widgets Used**:
  - `ListView.builder` - For scrollable message list
  - `Row` & `Column` - For layout organization
  - `Container` - For message bubble styling
  - `TextField` - For message input
  - `CircleAvatar` - For user avatars
  - `ScrollController` - For auto-scroll functionality

## Project Structure

```
lib/
├── main.dart                 # App entry point
├── models/
│   └── message.dart         # Message data model
├── screens/
│   └── chat_screen.dart     # Main chat interface
└── widgets/
    └── message_bubble.dart  # Custom message bubble widget
```

## Getting Started

### Prerequisites

- Flutter SDK installed (3.0.0 or higher)
- An IDE (VS Code, Android Studio, or IntelliJ)
- An emulator or physical device

### Installation

1. Navigate to the project directory:

   ```bash
   cd "Chat UI Clone"
   ```

2. Install dependencies:

   ```bash
   flutter pub get
   ```

3. Run the app:
   ```bash
   flutter run
   ```

## Features Breakdown

### 1. Message Model (`message.dart`)

Defines the structure of a chat message:

- Text content
- Sender information
- Timestamp
- Message direction (sent/received)

### 2. Message Bubble Widget (`message_bubble.dart`)

- Dynamic styling based on message sender
- Rounded corners with different radii
- Color differentiation (blue for sent, grey for received)
- Avatar display
- Timestamp formatting

### 3. Chat Screen (`chat_screen.dart`)

- AppBar with user info and action buttons
- Scrollable message list
- Message input field at the bottom
- Auto-scroll on new messages
- Sample conversation data

## Customization

You can customize the following:

- **Colors**: Modify `Colors.blue.shade500` for sent messages
- **Avatar Letters**: Change the displayed letter in CircleAvatar
- **Sample Messages**: Edit `_loadSampleMessages()` in `chat_screen.dart`
- **Border Radius**: Adjust bubble corner radius in `message_bubble.dart`

## Learning Outcomes

This project demonstrates:

1. Complex Flutter layouts using Row, Column, and Container
2. ListView with ScrollController for dynamic content
3. State management with StatefulWidget
4. Custom widget creation and reusability
5. Material Design 3 implementation
6. Responsive UI design patterns

## Next Steps

Potential enhancements:

- Add image/file sharing
- Implement read receipts
- Add typing indicators
- Create group chat functionality
- Add emoji picker
- Implement search functionality
- Add swipe-to-reply gestures

## License

This is an educational project for learning Flutter UI development.
# ChatUIClone
