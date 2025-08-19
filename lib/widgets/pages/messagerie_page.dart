import 'package:flutter/material.dart';
import 'package:proximore/widgets/components/chat/chatListItem.dart';
import 'package:proximore/widgets/components/search/searchTextFieldWidget.dart';
import 'package:proximore/widgets/components/user/usersListItem.dart';
// import '../../data_source/data.dart';

import 'package:proximore/models/Chat.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:proximore/data_source/auth_service.dart';

class MessageriePage extends StatefulWidget {
  const MessageriePage({Key? key}) : super(key: key);

  @override
  _MessageriePageState createState() => _MessageriePageState();
}

class _MessageriePageState extends State<MessageriePage> {
  List<Chat> chats = [];

  Future<void> handleGetChats(String? search) async {
    final url = Uri.parse(
        'https://app-backend-jhpm.onrender.com/api/users/userChats/${AuthService().userId}');

    final response = await http.get(
      url,
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      final List<dynamic> jsonList = jsonDecode(response.body);
      setState(() {
        chats = jsonList.map((json) => Chat.fromJson(json)).toList();
      });
      // print('Chats fetched !');
      print('Chats fetched: ${response.body}');
    } else {
      print('Failed to fetch posts: ${response.body}');
    }
  }

  @override
  void initState() {
    super.initState();
    handleGetChats(null);
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
            SearchWidget(),
            SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0.0),
              child: ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: chats.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: ChatListItem(
                      chat: chats[index],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
