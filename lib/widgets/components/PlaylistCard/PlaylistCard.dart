import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:proximore/utils/constants.dart';

class PlaylistCard extends StatelessWidget {
  final String title;
  final String imagePath;

  PlaylistCard({required this.title, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(32),
          child: Image.asset(
            imagePath,
            width: 150,
            height: 150,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(height: 8),
        Text(
          title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
