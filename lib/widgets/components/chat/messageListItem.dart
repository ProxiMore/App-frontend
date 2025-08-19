import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:proximore/models/Chat.dart';
import 'package:proximore/models/Message.dart';
import 'package:proximore/data_source/auth_service.dart';
import 'package:proximore/utils/constants.dart';

class MessageListItem extends StatelessWidget {
  final Chat chat;
  final Message message;
  final VoidCallback? onFavorite;
  final VoidCallback? onDetails;

  const MessageListItem({
    Key? key,
    required this.chat,
    required this.message,
    this.onFavorite,
    this.onDetails,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isMyMessage = message.user.id == AuthService().userId.toString();

    return Container(
      margin: EdgeInsets.only(
        right: isMyMessage ? 40 : 16,
        left: isMyMessage ? 16 : 40,
        bottom: 8,
      ),
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      decoration: BoxDecoration(
        color: isMyMessage
            ? Constants.secondaryGreen
            : const Color.fromARGB(255, 226, 226, 226),
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Image à gauche
          Container(
            width: 26.0,
            height: 26.0,
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
                  message.user.username,
                  style: const TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54,
                  ),
                ),
                const SizedBox(height: 4.0),
                Text(
                  message.content,
                  style: const TextStyle(
                    fontSize: 14.0,
                    color: Colors.black,
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
