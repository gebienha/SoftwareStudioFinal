import 'dart:async';
import 'dart:convert';
import 'chat_message.dart';
import 'package:http/http.dart' as http;

class ChatService {
  static const String _apiKey =
      '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'; // FIXME: Replace with your API key
  // Assuming you have created an assistant and a thread beforehand and have their IDs
  static const String _assistantId =
      'asst_tfSvpQ2BKUNk1XAR3fS1yr2V'; // FIXME: Replace with your assistant ID
  static const String _threadId =
      'thread_yA8PA8TnjHLNTolhmkc6jput'; // FIXME: Replace with your thread ID
  static const String _baseUrl = 'https://api.openai.com/v1';
  static const String _messagesUrl = '$_baseUrl/threads/$_threadId/messages';
  static const String _runsUrl = '$_baseUrl/threads/$_threadId/runs';

  final _messagesStreamController =
      StreamController<List<ChatMessage>>.broadcast();
  // Assume that the messages are stored in descending order (latest message first)
  List<ChatMessage> _messages = [];

  Stream<List<ChatMessage>> get messagesStream =>
      _messagesStreamController.stream;

  Future<void> fetchMessages() async {
    var response = await http.get(
      Uri.parse(_messagesUrl),
      headers: {
        'Authorization': 'Bearer $_apiKey',
        'OpenAI-Beta': 'assistants=v1',
      },
    );

    // Check if messages were successfully fetched
    if (response.statusCode != 200) {
      throw Exception('Failed to fetch messages: ${response.statusCode}');
    }

    var responseData = json.decode(utf8.decode(response.bodyBytes));
    _messages = [
      for (var message in responseData['data'])
        ChatMessage(
          role: message['role'],
          text: message['content'][0]['text']['value'],
        )
    ];
    _messagesStreamController.add(_messages);
  }

  Future<void> fetchPromptResponse(String prompt) async {
    _messages.insert(0, ChatMessage(role: 'user', text: prompt));
    _messages.insert(
      0,
      ChatMessage(role: 'assistant', text: 'Generating response...'),
    );
    _messagesStreamController.add(List.from(_messages));

    // 1. Post prompt to the thread
    var promptResponse = await http.post(
      Uri.parse(_messagesUrl),
      headers: {
        'Content-Type': 'application/json; charset=utf-8',
        'Authorization': 'Bearer $_apiKey',
        'OpenAI-Beta': 'assistants=v1',
      },
      body: jsonEncode({
        'role': 'user',
        'content': prompt,
      }),
    );
    // Check if the prompt was successfully added
    if (promptResponse.statusCode != 200) {
      throw Exception('Failed to add prompt: ${promptResponse.statusCode}');
    }

    // 2. Creating a run to generate a response
    var runResponse = await http.post(
      Uri.parse(_runsUrl),
      headers: {
        'Content-Type': 'application/json; charset=utf-8',
        'Authorization': 'Bearer $_apiKey',
        'OpenAI-Beta': 'assistants=v1',
      },
      body: jsonEncode({
        'assistant_id': _assistantId,
        // Additional instructions can be passed here if needed
      }),
    );
    // Check if run was successfully created
    if (runResponse.statusCode != 200) {
      throw Exception('Failed to create a run: ${runResponse.statusCode}');
    }

    // 3. Wait for the run to complete
    var runData = json.decode(runResponse.body);
    var runId = runData['id'];
    String runStatusUrl = '$_baseUrl/threads/$_threadId/runs/$runId';
    while (true) {
      // Wait for a short period before checking again
      await Future.delayed(Duration(seconds: 2));

      var runStatusResponse = await http.get(
        Uri.parse(runStatusUrl),
        headers: {
          'Authorization': 'Bearer $_apiKey',
          'Content-Type': 'application/json; charset=utf-8',
          'OpenAI-Beta': 'assistants=v1',
        },
      );
      if (runStatusResponse.statusCode != 200) {
        throw Exception(
            'Failed to query run status: ${runStatusResponse.statusCode}');
      }
      var runStatusData = json.decode(runStatusResponse.body);
      var runStatus = runStatusData['status'];
      if (runStatus == 'cancelled' ||
          runStatus == 'failed' ||
          runStatus == 'expired') {
        throw Exception('Run failed: ${runStatusData['status']}');
      }
      // Indicate that Function Calling is used (see: https://platform.openai.com/docs/assistants/tools/function-calling)
      if (runStatus == 'requires_action') {
        _messages[0] =
            ChatMessage(role: 'assistant', text: 'Performing action...');
        _messagesStreamController.add(List.from(_messages));
      }
      if (runStatus == 'completed') {
        break;
      }
    }

    // 4. Fetch all messages, including the assistant's response
    await fetchMessages();
  }

  void dispose() {
    _messagesStreamController.close();
  }
}
