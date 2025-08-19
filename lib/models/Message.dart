import 'User.dart';

class Message {
  final String id;
  final String content;
  final bool beenRead;
  final String createdAt;
  final String updatedAt;
  final String chatId;
  final User user;

  Message({
    required this.id,
    required this.content,
    required this.beenRead,
    required this.createdAt,
    required this.updatedAt,
    required this.chatId,
    required this.user,
  });

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      id: json['id'],
      content: json['content'],
      beenRead: json['been_read'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      chatId: json['chat_id'],
      user: json['user'] != null
          ? User.fromJson(json['user'])
          : User(
              id: '',
              username: '',
              profilePictureUri: '',
              bio: null,
              profileImage: ''),
    );
  }
}
