import 'User.dart';
import 'ChatUser.dart';

class Chat {
  final String name;
  final bool is_group;
  final String created_at;
  final User user;
  final ChatUser chat_user;
  final List<ChatUser> otherUserChats;

  Chat({
    required this.name,
    required this.is_group,
    required this.created_at,
    required this.user,
    required this.chat_user,
    required this.otherUserChats,
  });

  factory Chat.fromJson(Map<String, dynamic> json) {
    return Chat(
      name: json['name'],
      is_group: json['is_group'],
      created_at: json['created_at'],
      user: json['user'] != null
          ? User.fromJson(json['user'])
          : User(
              username: '', profilePictureUri: '', bio: null, profileImage: ''),
      chat_user: (json['user_chats'] != null &&
              (json['user_chats'] as List).isNotEmpty)
          ? ChatUser.fromJson((json['user_chats'] as List).first)
          : ChatUser(id: '', user_chat_name: ''),
      otherUserChats: json['other_user_chats'] != null
          ? (json['other_user_chats'] as List)
              .map((e) => ChatUser.fromJson(e))
              .toList()
          : [],
    );
  }
}
