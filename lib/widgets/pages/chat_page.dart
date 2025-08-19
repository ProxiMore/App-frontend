import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:proximore/utils/constants.dart';
import 'package:go_router/go_router.dart';

import 'package:proximore/models/Chat.dart';
import 'package:proximore/models/Message.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:proximore/data_source/auth_service.dart';

import 'package:proximore/widgets/components/chat/chatTopBar.dart';
import 'package:proximore/widgets/components/chat/chatBottomBar.dart';
import 'package:proximore/widgets/components/chat/messageListItem.dart';

class ChatPage extends StatefulWidget {
  final Chat chat; // Accepte un paramètre Chat

  const ChatPage({
    super.key,
    required this.chat,
  });

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List<Message> messages = [];

  Future<void> handleGetMessages() async {
    final url = Uri.parse(
        'https://app-backend-jhpm.onrender.com/api/chats/chatMessages/${widget.chat?.id}');

    final response = await http.get(
      url,
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      final List<dynamic> jsonList = jsonDecode(response.body);
      setState(() {
        messages = jsonList.map((json) => Message.fromJson(json)).toList();
      });
      print('Messages fetched !');
      // print('Messages fetched: ${response.body}');
    } else {
      print('Failed to fetch messages: ${response.body}');
    }
  }

  Future<void> handlePostMessage(BuildContext context, String? text) async {
    if (text == null || text.trim().isEmpty) {
      return; // Ne pas envoyer de message vide
    }

    final url = Uri.parse('https://app-backend-jhpm.onrender.com/api/messages');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        "content": text,
        "chat_id": widget.chat.id,
        "user_id": AuthService().userId,
      }),
    );
    if (response.statusCode == 201) {
      print('Message created: ${response.body}');
    } else {
      print('Failed to create message: ${response.body}');
    }
  }

  @override
  void initState() {
    super.initState();
    handleGetMessages();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(top: 18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ChatTopBar(chat: widget.chat),
            SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0.0),
              child: ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: messages.length,
                reverse: true,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(0.0),
                    // child: Text(messages[0].content)
                    child: MessageListItem(
                      chat: widget.chat,
                      message: messages[index],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: ChatBottomBar(
        chat: widget.chat,
        onSubmitted: (text) async {
          await handlePostMessage(context, text);
          await handleGetMessages();
        },
      ),
    );
  }
}
