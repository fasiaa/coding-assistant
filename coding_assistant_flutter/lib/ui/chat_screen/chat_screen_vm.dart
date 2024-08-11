import 'package:flutter/material.dart';

class ChatProvider with ChangeNotifier {
  final List<String> _messages = [
    "Hey there! How's it going?",
    "I'm doing great, thanks for asking. How about you?",
    "I'm good too! Just working on a Flutter project.",
    "Nice! What are you working on?",
    "I'm building a chat application for the web.",
    "That sounds interesting. Is it for a specific use case?",
    "Yes, it's for a customer support application.",
    "Cool! Are you using any specific libraries or frameworks?",
    "I'm using Flutter for the frontend and Firebase for the backend.",
    "Nice choice! Firebase is great for real-time data.",
    "Absolutely. It simplifies a lot of things. How's your day going?",
    "Pretty busy, but I'm managing. What about you?",
    "Same here, lots of tasks to handle. But it's all good!",
    "Glad to hear that. Maybe we can catch up over a call sometime?",
    "Definitely! Let's schedule something soon.",
    "Sounds like a plan. Talk to you later!",
    "Sure! Have a great day!",
  ];

  List<String> get messages => _messages;

  void addMessage(String message) {
    _messages.add(message);
    notifyListeners();
  }
}
