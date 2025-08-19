import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
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
            ],
          ),
        ),
      ),
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
