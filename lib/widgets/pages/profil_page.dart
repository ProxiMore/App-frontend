import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:proximore/widgets/components/MusiqueFavorite/MusiqueFavorite.dart';
import 'package:proximore/utils/constants.dart';
import 'package:proximore/widgets/components/PlaylistCard/PlaylistCard.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:proximore/widgets/components/buttons/icon_button.dart';

class ProfilPage extends StatelessWidget {
  const ProfilPage({super.key});

  @override
  Widget build(BuildContext context) {
    const MUSIC_LIST = [
      {
        "title": "Voyage Intérieur",
        "album": "Chemins Cachés",
        "media": "",
      },
      {
        "title": "Echos éternels",
        "album": "Renaissance",
        "media": "",
      },
      {
        "title": "Voyage intérieur",
        "album": "Rêveries introspectives",
        "media": ""
      }
    ];

    return Scaffold(
      backgroundColor: Constants.lightest,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DisplayTopBar(),
              SizedBox(height: 10),
              Text(
                'BONJOUR, CLARA',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Constants.secondaryOrange,
                ),
              ),
              SizedBox(height: 10),
              DisplayPlaylist(),
              SizedBox(height: 10),
              DisplayFavoriteTracks(),
              Center(
                child: Text(
                  'VOIR PLUS',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Constants.primaryBlue,
                  ),
                ),
              ),
              DisplayTexts(),
              //Container(height: 500, width: 300, color: Colors.green),
            ],
          ),
        ),
      ),
    );
  }
}

class DisplayTexts extends StatelessWidget {
  const DisplayTexts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    const TEXT_LIST = [
      {"title": "Voyage Intérieur VI"},
      {"title": "Essai"},
      {"title": "Impro"},
      {"title": "Renaissance"}
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 25),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                'AJOUTER UN TEXTE',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Constants.primaryBlue,
                ),
              ),
              SizedBox(width: 30),
              UIIconButton(
                  icon: Constants.addIcon,
                  color: Constants.primaryBlue,
                  size: 18,
                  callback: () {
                    context.push('/new-text');
                  }),
            ],
          ),
          SizedBox(height: 5),
          Container(
            //color: Constants.secondaryOrange,
            height: 200,
            child: ListView.builder(
              itemCount: TEXT_LIST.length,
              itemBuilder: (context, index) {
                final item = TEXT_LIST[index];
                return Row(
                  children: [
                    SvgPicture.asset(
                      Constants.typoIcon,
                      width: 16,
                      colorFilter: ColorFilter.mode(
                        Constants.black,
                        BlendMode.srcIn,
                      ),
                    ),
                    const SizedBox(width: 20),
                    Text(
                      item['title']!,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                    Spacer(),
                    UIIconButton(
                        icon: Constants.pointsIcon,
                        color: Constants.primaryBlue,
                        size: 14,
                        callback: () {})
                  ],
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

class DisplayFavoriteTracks extends StatelessWidget {
  const DisplayFavoriteTracks({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'VOS MORCEAUX FAVORIS',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Constants.primaryBlue,
          ),
        ),
        FavoriteTracksWidget(
          tracks: [
            Track(
              title: 'VOYAGE INTÉRIEUR',
              artist: 'Chemins Cachés',
              imagePath: 'assets/images/image_musique1.jpg',
            ),
            Track(
              title: 'ROUNHAA',
              artist: 'ICE',
              imagePath: 'assets/images/image_musique2.jpg',
            ),
            Track(
              title: 'MICHAEL JACKSON',
              artist: 'Thriller',
              imagePath: 'assets/images/image_musique3.jpg',
            ),
          ],
        ),
      ],
    );
  }
}

class DisplayPlaylist extends StatelessWidget {
  const DisplayPlaylist({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'PLAYLIST',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Constants.black,
          ),
        ),
        SizedBox(height: 16),
        CarouselSlider(
          options: CarouselOptions(
            enableInfiniteScroll: false,
            reverse: false,
            enlargeCenterPage: false,
            scrollDirection: Axis.horizontal,
            viewportFraction: 0.5,
            initialPage: 0,
            padEnds: false,
          ),
          items: [
            PlaylistCard(
              title: 'Les Failles',
              imagePath:
                  'assets/images/image_album1.jpg', // Replace with your image asset
            ),
            PlaylistCard(
              title: 'A Peu Près',
              imagePath:
                  'assets/images/image_album2.jpg', // Replace with your image asset
            ),
            PlaylistCard(
              title: 'Saisons',
              imagePath:
                  'assets/images/image_album3.jpg', // Replace with your image asset
            ),
          ],
        ),
      ],
    );
  }
}

class DisplayTopBar extends StatelessWidget {
  const DisplayTopBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              context.go('/');
            },
            child: SvgPicture.asset(
              width: 32,
              height: 32,
              Constants.closeIcon,
              colorFilter: const ColorFilter.mode(
                  Constants.primaryBlue, BlendMode.srcIn),
            ),
          ),
          Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image(
                image: AssetImage('assets/images/profile4.jpg'),
                width: 100,
                fit: BoxFit.cover,
                height: 100,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              context.go('/settings');
            },
            child: SvgPicture.asset(
              Constants.parameterIcon,
              width: 32,
              height: 32,
              colorFilter: const ColorFilter.mode(
                  Constants.primaryBlue, BlendMode.srcIn),
            ),
          ),
        ],
      ),
    );
  }
}
