import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

class GeminiApiService {
  final String _baseurl =
      "https://generativelanguage.googleapis.com/v1beta/models/gemini-1.5-flash-latest:generateContent";
  final String _apiKey = "AIzaSyAbCE8fiai3OObZI39Oby8l4BDG9HNvzaU";

  Future<Map<String, dynamic>> sendMessage(String message) async {
    final url = Uri.parse('$_baseurl?key=$_apiKey');
    try {
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'contents': [
            {
              'parts': [
                {
                  'text': message,
                }
              ],
            }
          ],
        }),
      );

      if (response.statusCode == 200) {
        final responseBody = jsonDecode(response.body);
        // Debugging print statement to check the response structure
        log('Response body $responseBody');
        return responseBody;
      } else {
        throw Exception('Failed to load response: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}
