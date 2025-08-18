import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:proximore/models/Album.dart';

class MusicWidget extends StatelessWidget {
  final Album album;

  MusicWidget({
    required this.album,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          context.go('/play_page', extra: album);
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 160,
              height: 160,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(24),
                image: DecorationImage(
                  image: AssetImage(
                      album.mediaUri ?? 'assets/images/no-album.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 4.0),
            Text(
              album.title,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                //fontWeight: FontWeight.bold,
                fontSize: 14.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
