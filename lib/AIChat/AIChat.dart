import 'package:flutter/material.dart';

import '../../components/socal_card.dart';
import '../../constants.dart';
import 'components/AIChat_form.dart';
import 'models/chat_message.dart';
import 'services/assistant.dart';
//import 'services/chat.dart';

class AIChat extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<AIChat> {
  final TextEditingController _textController = TextEditingController();
  final ChatService _chatService = ChatService();

  @override
  void initState() {
    super.initState();
    _chatService.fetchMessages();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat App'),
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder<List<ChatMessage>>(
              stream: _chatService.messagesStream,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                  return ListView.builder(
                    reverse: true,
                    itemCount:
                        snapshot.data!.length + 1, // one extra for padding
                    itemBuilder: (context, index) {
                      if (index == 0) {
                        return const SizedBox(height: 16);
                      }
                      final message = snapshot.data![index - 1];
                      return ListTile(
                        title: Text(message.role[0].toUpperCase() +
                            message.role.substring(1)),
                        subtitle: Text(message.text),
                      );
                    },
                  );
                } else {
                  return const Center(
                      child: Text('Enter a prompt to get a response'));
                }
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            color: Theme.of(context).colorScheme.surfaceVariant,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  child: TextField(
                    controller: _textController,
                    decoration:
                        const InputDecoration(hintText: 'Enter your prompt'),
                    maxLines: null, // Allows input to expand
                  ),
                ),
                const SizedBox(width: 16.0),
                IconButton(
                icon: const Icon(Icons.send),
                onPressed: () {
                    if (_textController.text.isNotEmpty) {
                      _chatService
                          .fetchPromptResponse(_textController.text.trim());
                      _textController.clear();
                    }
                  },
                  
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
