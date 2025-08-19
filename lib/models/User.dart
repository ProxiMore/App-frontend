class User {
  final String id;
  final String username;
  final String? profilePictureUri;
  final String? bio;

  User({
    required this.id,
    required this.username,
    this.profilePictureUri,
    this.bio,
    String? profileImage,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['user_id'] ?? '',
      username: json['username'] ?? '',
      profilePictureUri: json['profile_picture_uri'] ?? '',
      bio: json['bio'],
      profileImage: json['profile_picture_uri'] ?? '',
    );
  }
}
