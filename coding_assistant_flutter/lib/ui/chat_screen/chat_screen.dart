import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:coding_assistant_flutter/core/constants/screen_utils.dart';
import 'package:coding_assistant_flutter/core/models/chat_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import '../widgets/reusable_appbar.dart';
import 'chat_screen_vm.dart'; // Import the ChatProvider

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  ChatScreenState createState() => ChatScreenState();
}

class ChatScreenState extends State<ChatScreen> {
  bool isTyping = false;
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final chatProvider = Provider.of<ChatProvider>(context);

    return Scaffold(
      appBar: reusableAppBar(context),
      body: Container(
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: <Color>[
              Color(0xFF1A1B26),
              Color(0xFF1B2236),
            ],
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                reverse: true,
                itemCount: chatProvider.messages.length,
                itemBuilder: (context, index) {
                  final message = chatProvider
                      .messages[chatProvider.messages.length - 1 - index];

                  return ChatWidget(
                    message: message,
                  );
                },
              ),
            ),
            if (isTyping) ...[
              const SpinKitThreeBounce(
                color: Colors.white,
                size: 18,
              ),
            ],
            kHeight(24),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _controller,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          onPressed: () {
                            if (_controller.text.trim().isNotEmpty) {
                              chatProvider.sendMessage(_controller.text.trim());
                              _controller.clear();
                            }
                          },
                          icon: const Icon(
                            Icons.send,
                            color: Color(0xFFBB9AF7),
                          ),
                        ),
                        hintText: 'Type a message',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  // IconButton(
                  //   icon: const Icon(
                  //     Icons.send,
                  //     color: Color(0xFFBB9AF7),
                  //   ),
                  //   onPressed: _sendMessage,
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ChatWidget extends StatelessWidget {
  const ChatWidget({
    super.key,
    required this.message,
  });

  final ChatMessage message;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment:
          message.isSentByUser ? Alignment.centerRight : Alignment.centerLeft,
      padding: const EdgeInsets.symmetric(
        vertical: 4,
        horizontal: 8,
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 14,
        ),
        decoration: BoxDecoration(
          color: message.isSentByUser
              ? const Color(0xFF22273D)
              : const Color(0xFF3B4261),
          borderRadius: BorderRadius.circular(10),
        ),
        child: message.isSentByUser
            ? Text(
                message.text,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Colors.white,
                    ),
              )
            : DefaultTextStyle(
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Colors.white,
                    ),
                child: AnimatedTextKit(
                  isRepeatingAnimation: false,
                  repeatForever: false,
                  displayFullTextOnTap: true,
                  totalRepeatCount: 1,
                  animatedTexts: [
                    TyperAnimatedText(
                      message.text.trim(),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
