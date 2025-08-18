import 'package:flutter/material.dart';
import 'package:proximore/widgets/components/carousel/musicWidget.dart';
import 'package:proximore/data_source/data.dart';
import 'package:proximore/models/Album.dart';

class MusicCarouselwidget extends StatelessWidget {
  final String title;
  final List<Album> albums;

  const MusicCarouselwidget({
    super.key,
    required this.title,
    required this.albums,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 24.0, top: 10.0),
            child: Text(
              title,
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          SizedBox(height: 20.0),
          Container(
            height: 250.0,
            /*
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                MusicWidget(imagePath: 'assets/fonts/music.png', title: 'Nom'),
                MusicWidget(imagePath: 'assets/fonts/music.png', title: 'Nom'),
                MusicWidget(imagePath: 'assets/fonts/music.png', title: 'Nom'),
                MusicWidget(imagePath: 'assets/fonts/music.png', title: 'Nom'),
                MusicWidget(imagePath: 'assets/fonts/music.png', title: 'Nom'),
                MusicWidget(imagePath: 'assets/fonts/music.png', title: 'Nom'),
                MusicWidget(imagePath: 'assets/fonts/music.png', title: 'Nom'),
                MusicWidget(imagePath: 'assets/fonts/music.png', title: 'Nom'),
              ],
            ),
             */
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: albums.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: MusicWidget(album: albums[index]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
