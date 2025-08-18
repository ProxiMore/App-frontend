import 'package:flutter/material.dart';
import 'package:proximore/utils/constants.dart';
import 'package:proximore/widgets/components/user/profile_card.dart';
import 'package:proximore/widgets/components/buttons/icon_button.dart';
import 'package:proximore/models/Post.dart';

import '../buttons/icon_button_toggle.dart';

class UIPostCard extends StatelessWidget {
  final Post post;

  UIPostCard({
    super.key,
    required this.post,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 30,
        vertical: 15,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Constants.light,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ProfileCard(
            image: (post.user.profilePictureUri == null ||
                    post.user.profilePictureUri!.isEmpty)
                ? 'assets/images/no-profile.jpeg'
                : post.user.profilePictureUri.toString(),
            title: post.title,
          ),
          const SizedBox(height: 10),
          Text(
            'Détails : ${post.content}',
            style: TextStyle(
              color: Constants.darkest,
              fontFamily: 'Paralucent',
              fontSize: 14,
            ),
          ),
          Text(
            'Nom : ${post.user.username}', // ?? '',
            style: TextStyle(
              color: Constants.darkest,
              fontFamily: 'Paralucent',
              fontSize: 14,
            ),
          ),
          Text(
            'Adresse : ${post.address}', // ?? '',
            style: TextStyle(
              color: Constants.darkest,
              fontFamily: 'Paralucent',
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 5),
          if (post.tags != null)
            Text(
              post.tags!,
              style: TextStyle(
                color: Constants.primaryBlue,
                fontFamily: 'Paralucent',
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 60),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                UIIconToggleButton(
                  icon: Constants.likeIcon,
                  color: Constants.primaryBlue,
                  secondaryColor: Constants.secondaryRed,
                  size: 20,
                  callback: () {},
                ),
                UIIconButton(
                  icon: Constants.messageIcon,
                  color: Constants.primaryBlue,
                  size: 20,
                  callback: () {},
                ),
                UIIconButton(
                  icon: Constants.replayIcon,
                  color: Constants.primaryBlue,
                  size: 20,
                  callback: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
