import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:proximore/utils/constants.dart';

import '../buttons/icon_button.dart';

class FavoriteTracksWidget extends StatelessWidget {
  final List<Track> tracks;

  FavoriteTracksWidget({required this.tracks});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 16),
        ...tracks.map((track) => FavoriteTrackCard(track: track)).toList(),
        SizedBox(height: 16),
      ],
    );
  }
}

class FavoriteTrackCard extends StatelessWidget {
  final Track track;

  FavoriteTrackCard({required this.track});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  track.imagePath,
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    track.title,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    track.artist,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ],
          ),
          UIIconButton(
            icon: Constants.likeIcon,
            color: Constants.primaryBlue,
            callback: () {},
          ),
        ],
      ),
    );
  }
}

class Track {
  final String title;
  final String artist;
  final String imagePath;

  Track({
    required this.title,
    required this.artist,
    required this.imagePath,
  });
}
