import 'package:flutter/material.dart';
import '../../core/models/chat_model.dart';
import '../../core/services/gemini_services.dart';

class ChatProvider with ChangeNotifier {
  final GeminiApiService _apiService = GeminiApiService();
  final List<ChatMessage> _messages = [];

  List<ChatMessage> get messages => _messages;

  Future<void> sendMessage(String message) async {
    _messages.add(ChatMessage(
      text: message,
      isSentByUser: true,
    ));
    notifyListeners();

    try {
      final response = await _apiService.sendMessage(message);

      // Extract response text from JSON
      final candidates = response['candidates'] as List<dynamic>? ?? [];
      if (candidates.isNotEmpty) {
        final content = candidates[0]['content'] as Map<String, dynamic>? ?? {};
        final parts = content['parts'] as List<dynamic>? ?? [];
        if (parts.isNotEmpty) {
          final text = parts[0]['text'] as String? ?? 'No response';
          _messages.add(ChatMessage(
            text: text,
            isSentByUser: false,
          ));
        } else {
          _messages.add(
            ChatMessage(
              text: 'No parts in response',
              isSentByUser: false,
            ),
          );
        }
      } else {
        _messages.add(
          ChatMessage(
            text: 'No candidates in response',
            isSentByUser: false,
          ),
        );
      }
    } catch (e) {
      _messages.add(
        ChatMessage(
          text: 'Error: $e',
          isSentByUser: false,
        ),
      );
    }

    notifyListeners();
  }
}
