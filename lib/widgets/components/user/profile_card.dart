import 'package:flutter/material.dart';
import 'package:proximore/utils/constants.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({
    super.key,
    required this.image,
    required this.title,
    this.subtitle,
    this.alignment = CrossAxisAlignment.start,
  });

  final String image;
  final String title;
  final String? subtitle;
  final CrossAxisAlignment alignment;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: alignment,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20), // Image border
          child: SizedBox.fromSize(
              size: Size.fromRadius(40), // Image radius
              child: Image.asset(image, fit: BoxFit.cover)),
        ),
        SizedBox(width: 15),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title.toUpperCase(),
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Constants.darkest,
              ),
            ),
            if (subtitle != null)
              Text(
                subtitle ?? '',
                style: TextStyle(
                  color: Constants.darkest,
                  fontFamily: 'Paralucent',
                  fontSize: 16,
                ),
              ),
          ],
        ),
      ],
    );
  }
}
