import 'package:flutter/material.dart';
import 'package:proximore/utils/constants.dart';
import 'package:proximore/widgets/components/user/profile_card.dart';
import 'package:proximore/widgets/components/buttons/icon_button.dart';
import 'package:proximore/models/Post.dart';

import '../buttons/icon_button_toggle.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:proximore/data_source/auth_service.dart';
import 'package:proximore/models/Chat.dart';
import 'package:go_router/go_router.dart';

class UIPostCard extends StatelessWidget {
  final Post post;

  UIPostCard({
    super.key,
    required this.post,
  });

  @override
  Widget build(BuildContext context) {
    List<Chat> chats = [];

    Future<void> handleNewChat() async {
      final url = Uri.parse('https://app-backend-jhpm.onrender.com/api/chats');

      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          "name": "Discussion avec ${post.user.username}",
          "user_id": [AuthService().userId.toString(), post.user.id],
        }),
      );

      if (response.statusCode == 201) {
        print('Post created: ${response.body}');

        final List<dynamic> jsonList = jsonDecode(response.body);
        chats = jsonList.map((json) => Chat.fromJson(json)).toList();
        context.go('/chat_page', extra: chats[0]);
      } else {
        print('Failed to create post: ${response.body}');
      }
    }

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 30,
        vertical: 15,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Constants.light,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ProfileCard(
            image: (post.user.profilePictureUri == null ||
                    post.user.profilePictureUri!.isEmpty)
                ? 'assets/images/no-profile.jpeg'
                : post.user.profilePictureUri.toString(),
            title: post.title,
          ),
          const SizedBox(height: 10),
          Text(
            'Détails : ${post.content}',
            style: TextStyle(
              color: Constants.darkest,
              fontFamily: 'Paralucent',
              fontSize: 14,
            ),
          ),
          Text(
            'Nom : ${post.user.username}',
            style: TextStyle(
              color: Constants.darkest,
              fontFamily: 'Paralucent',
              fontSize: 14,
            ),
          ),
          Text(
            'Adresse : ${post.address}',
            style: TextStyle(
              color: Constants.darkest,
              fontFamily: 'Paralucent',
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 5),
          if (post.tags != null)
            Text(
              post.tags!,
              style: TextStyle(
                color: Constants.primaryBlue,
                fontFamily: 'Paralucent',
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 60),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                UIIconToggleButton(
                  icon: Constants.likeIcon,
                  color: Constants.primaryBlue,
                  secondaryColor: Constants.secondaryRed,
                  size: 20,
                  callback: () {},
                ),
                UIIconButton(
                  icon: Constants.messageIcon,
                  color: Constants.primaryBlue,
                  size: 20,
                  callback: () {
                    print("--- AAAAAAAAAAAAAAAA ---");
                    handleNewChat();
                  },
                ),
                UIIconButton(
                  icon: Constants.replayIcon,
                  color: Constants.primaryBlue,
                  size: 20,
                  callback: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
