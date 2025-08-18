import 'dart:ffi';

class ChatUser {
  final String id;
  final String? user_chat_name;
  final String? username;
  final String? profilePictureUri;
  final String? bio;
  final DateTime? createdAt;

  ChatUser({
    required this.id,
    this.user_chat_name,
    this.username,
    this.profilePictureUri,
    this.bio,
    this.createdAt,
  });

  factory ChatUser.fromJson(Map<String, dynamic> json) {
    return ChatUser(
      id: json['user_id'] ?? json['id'] ?? '',
      user_chat_name: json['user_chat_name'],
      username: json['username'],
      profilePictureUri: json['profile_picture_uri'],
      bio: json['bio'],
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'])
          : null,
    );
  }
}
