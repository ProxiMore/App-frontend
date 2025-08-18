import 'package:flutter/material.dart';
import 'package:proximore/models/Chat.dart';

class ChatListItem extends StatelessWidget {
  final Chat chat;
  final VoidCallback? onFavorite;
  final VoidCallback? onDetails;

  const ChatListItem({
    Key? key,
    required this.chat,
    this.onFavorite,
    this.onDetails,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Image à gauche
          Container(
            width: 60.0,
            height: 60.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              image: DecorationImage(
                image: AssetImage((chat.user.profilePictureUri != null &&
                        chat.user.profilePictureUri!.isNotEmpty)
                    ? chat.user.profilePictureUri!
                    : 'assets/images/no-profile.jpeg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 12.0),
          // Texte titre et auteur
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  (chat.chat_user.user_chat_name != null &&
                          chat.chat_user.user_chat_name!.isNotEmpty)
                      ? chat.chat_user.user_chat_name!
                      : chat.name,
                  style: const TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 4.0),
                Text(
                  chat.user.username,
                  style: const TextStyle(
                    fontSize: 14.0,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
