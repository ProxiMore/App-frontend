import 'package:flutter/material.dart';
import 'package:proximore/widgets/components/carousel/musicCarouselWidget.dart';
import 'package:proximore/data_source/data.dart';

class MusicIacarouselwidget extends StatelessWidget {
  final List<String> titles; // Liste des titres

  const MusicIacarouselwidget({
    Key? key,
    required this.titles,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(titles.length, (index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 20.0),
          child: MusicCarouselwidget(
            title: titles[index],
            albums: Data.albums,
          ),
        );
      }),
    );
  }
}
