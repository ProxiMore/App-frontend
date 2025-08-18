import 'package:flutter/material.dart';

class PostCardWidget extends StatelessWidget {
  final String username;
  final String avatar;
  final String content;
  final String? image;
  final int likes;
  final int comments;
  final int shares;

  PostCardWidget({
    required this.username,
    required this.avatar,
    required this.content,
    this.image,
    required this.likes,
    required this.comments,
    required this.shares,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage(avatar),
                ),
                SizedBox(width: 8.0),
                Text(
                  username,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 8.0),
            Text(content),
            if (image != null) ...[
              SizedBox(height: 8.0),
              Image.asset(image!),
            ],
            SizedBox(height: 8.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.thumb_up, color: Colors.grey),
                Text('$likes'),
                Icon(Icons.comment, color: Colors.grey),
                Text('$comments'),
                Icon(Icons.share, color: Colors.grey),
                Text('$shares'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}