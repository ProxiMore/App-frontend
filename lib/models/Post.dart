import 'User.dart';

class Post {
  final String title;
  final String? address;
  final String content;
  final User user;
  final DateTime created_at;
  final DateTime? updated_at;
  final String? mediaUri;
  final String? tags; // Paramètre optionnel pour les tags.

  Post({
    required this.title,
    this.address,
    required this.content,
    required this.user,
    required this.created_at,
    this.updated_at,
    this.mediaUri,
    this.tags,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      title: json['title'] ?? '',
      address: json['address'],
      content: json['content'] ?? '',
      user: json['user'] != null
          ? User.fromJson(json['user'])
          : User(
              id: '',
              username: '',
              profilePictureUri: '',
              bio: null,
              profileImage: ''),
      created_at: DateTime.parse(json['created_at']),
      updated_at: json['updated_at'] != null
          ? DateTime.parse(json['updated_at'])
          : null,
      mediaUri: json['mediaUri'],
      tags: json['tags'],
    );
  }
}
