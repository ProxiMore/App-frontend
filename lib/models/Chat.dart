import 'User.dart';
import 'ChatUser.dart';

class Chat {
  final String id;
  final String name;
  final bool is_group;
  final String created_at;
  final User user;
  final ChatUser chat_user;
  final List<ChatUser> otherUserChats;

  Chat({
    required this.id,
    required this.name,
    required this.is_group,
    required this.created_at,
    required this.user,
    required this.chat_user,
    required this.otherUserChats,
  });

  factory Chat.fromJson(Map<String, dynamic> json) {
    User parsedUser =
        User(id: '', username: '', profilePictureUri: '', bio: null);

    if (json['other_user_chats'] != null &&
        (json['other_user_chats'] as List).isNotEmpty) {
      final firstOther = json['other_user_chats'][0];
      parsedUser = User(
        id: firstOther['user_id'] ?? '',
        username: firstOther['username'] ?? '',
        profilePictureUri: firstOther['profile_picture_uri'],
        bio: firstOther['bio'],
      );
    }

    return Chat(
      id: json['id'],
      name: json['name'],
      is_group: json['is_group'],
      created_at: json['created_at'],
      user: parsedUser,
      chat_user: json['user_chats'] != null
          ? ChatUser.fromJson(json['user_chats'])
          : ChatUser(id: '', user_chat_name: ''),
      otherUserChats: json['other_user_chats'] != null
          ? (json['other_user_chats'] as List)
              .map((e) => ChatUser.fromJson(e))
              .toList()
          : [],
    );
  }
}
