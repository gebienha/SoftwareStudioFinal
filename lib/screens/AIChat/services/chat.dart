import 'dart:async';
import 'dart:convert';
import '../models/chat_message.dart';
import 'package:http/http.dart' as http;

class ChatService {
  static const String _apiKey =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoiN2QzMWYxYzQtMmRlZS00OWYyLWFkOGMtYzliZDhjMzU0MzUxIiwidHlwZSI6ImFwaV90b2tlbiJ9.MztGlxMf72GcyRcUQGPBfs9bjmpRV4EVgLRuFVdaJdA'; // FIXME: Replace with your API key
  static const String _url = 'https://api.openai.com/v1/chat/completions';

  final _messagesStreamController =
      StreamController<List<ChatMessage>>.broadcast();
  // Assume that the messages are stored in descending order (latest message first)
  final List<ChatMessage> _messages = [];

  Stream<List<ChatMessage>> get messagesStream =>
      _messagesStreamController.stream;

  Future<void> fetchMessages() async {
    // Simulating fetching past messages (not applicable with OpenAI's completions API directly)
    await Future.delayed(const Duration(seconds: 1));
    _messagesStreamController.add(List.of(_messages));
  }

  Future<void> fetchPromptResponse(String prompt) async {
    _messages.insert(0, ChatMessage(role: 'user', text: prompt));
    _messages.insert(
      0,
      ChatMessage(role: 'assistant', text: 'Generating response...'),
    );
    _messagesStreamController.add(List.from(_messages));

    // 1. Send the prompt and ENTIRE HISTORY to the chat completions API. If only the prompt is sent, the assistant will not remember the context of the conversation.
    var history = _messages
        .where((message) => message.text != 'Generating response...')
        .map((message) => {
              'role': message.role,
              'content': message.text,
            })
        .toList()
        .reversed
        .toList();
    var response = await http.post(
      Uri.parse(_url),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $_apiKey',
      },
      body: jsonEncode({
        'model': 'gpt-3.5-turbo', // Specify the model you're using
        'messages': history,
      }),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to fetch response: ${response.statusCode}');
    }

    // 2. Update local messages list with the assistant's response
    var data = json.decode(utf8.decode(response.bodyBytes));
    var responses = data['choices'][0]['message']['content'].trim();
    _messages[0] = ChatMessage(role: 'assistant', text: responses);

    // 4. Update the stream with the new messages list
    _messagesStreamController.add(List.from(_messages));
  }

  void dispose() {
    _messagesStreamController.close();
  }
}
