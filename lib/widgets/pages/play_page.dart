import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:proximore/utils/constants.dart';
import 'package:go_router/go_router.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:proximore/models/Album.dart';

import '../../data_source/data.dart';

class PlayPage extends StatefulWidget {
  final Album? album; // Accepte un paramètre Album

  const PlayPage({
    super.key,
    this.album,
  });

  @override
  _PlayPageState createState() => _PlayPageState();
}

class _PlayPageState extends State<PlayPage> {
  final AudioPlayer _audioPlayer = AudioPlayer();
  bool isPlaying = false;
  Duration _currentPosition = Duration.zero;
  Duration _totalDuration = Duration(minutes: 3, seconds: 29); // Durée simulée
  String audioFile = (Data.audioFiles.toList()..shuffle()).first;

  @override
  void initState() {
    super.initState();
    _audioPlayer.onPositionChanged.listen((Duration position) {
      setState(() {
        _currentPosition = position;
      });
    });

    _audioPlayer.onDurationChanged.listen((Duration duration) {
      setState(() {
        _totalDuration = duration;
      });
    });

    // Charger un fichier audio
    _audioPlayer.setSourceUrl(audioFile);
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    return "${twoDigits(duration.inMinutes)}:${twoDigits(duration.inSeconds.remainder(60))}";
  }

  void _playPause() {
    if (isPlaying) {
      _audioPlayer.pause();
    } else {
      _audioPlayer.play(UrlSource(audioFile));
    }
    setState(() {
      isPlaying = !isPlaying;
    });
  }

  void _stop() {
    _audioPlayer.stop();
    setState(() {
      isPlaying = false;
      _currentPosition = Duration.zero;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GestureDetector(
            onTap: () {},
            child: Image.asset(
              widget.album?.mediaUri ?? 'assets/images/image_musique2.jpg',
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
          ),
          Column(
            children: [
              AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                leading: GestureDetector(
                  onTap: () {
                    context.go('/');
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SvgPicture.asset(
                      Constants.closeIcon,
                      colorFilter: const ColorFilter.mode(
                          Constants.lighter, BlendMode.srcIn),
                      width: 20,
                      height: 20,
                    ),
                  ),
                ),
                centerTitle: true,
                title: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    'assets/images/Logo_Blue.png',
                    height: 100,
                    width: 100,
                    fit: BoxFit.contain,
                  ),
                ),
                actions: [
                  GestureDetector(
                    onTap: () {
                      context.go('/settings');
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SvgPicture.asset(
                        Constants.parameterIcon,
                        colorFilter: const ColorFilter.mode(
                            Constants.lighter, BlendMode.srcIn),
                        width: 40,
                        height: 40,
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: SafeArea(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Nom de la chanson et artiste
                      Text(
                        widget.album?.title ?? 'ICE',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        widget.album?.author ?? 'Rounhaa - Möbius',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Colors.white70,
                        ),
                      ),
                      SizedBox(height: 20),

                      // Barre de progression
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  _formatDuration(_currentPosition),
                                  style: TextStyle(color: Colors.white),
                                ),
                                Text(
                                  _formatDuration(_totalDuration),
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                            Slider(
                              value: _currentPosition.inSeconds.toDouble(),
                              max: _totalDuration.inSeconds.toDouble(),
                              activeColor: Colors.orange,
                              inactiveColor: Colors.white60,
                              onChanged: (double value) {
                                setState(() {
                                  _audioPlayer
                                      .seek(Duration(seconds: value.toInt()));
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20),

                      // Boutons de lecture
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            icon: Icon(Icons.skip_previous,
                                color: Colors.white, size: 40),
                            onPressed: () {
                              _audioPlayer.seek(
                                  Duration(seconds: 0)); // Revenir au début
                            },
                          ),
                          SizedBox(width: 20),
                          GestureDetector(
                            onTap: _playPause,
                            child: Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white.withOpacity(0.2),
                              ),
                              padding: EdgeInsets.all(12),
                              child: Icon(
                                isPlaying ? Icons.pause : Icons.play_arrow,
                                color: Colors.white,
                                size: 50,
                              ),
                            ),
                          ),
                          SizedBox(width: 20),
                          IconButton(
                            icon: Icon(Icons.skip_next,
                                color: Colors.white, size: 40),
                            onPressed: () {
                              _audioPlayer
                                  .seek(_totalDuration); // Aller à la fin
                            },
                          ),
                        ],
                      ),

                      SizedBox(height: 40),

                      // Icônes supplémentaires
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {},
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SvgPicture.asset(
                                Constants.exportIcon,
                                colorFilter: const ColorFilter.mode(
                                    Constants.white, BlendMode.srcIn),
                                width: 30,
                                height: 30,
                              ),
                            ),
                          ),
                          SizedBox(width: 20),
                          GestureDetector(
                            onTap: () {},
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SvgPicture.asset(
                                Constants.pointsIcon,
                                colorFilter: const ColorFilter.mode(
                                    Constants.white, BlendMode.srcIn),
                                width: 15,
                                height: 15,
                              ),
                            ),
                          ),
                          SizedBox(width: 20),
                          GestureDetector(
                            onTap: () {},
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SvgPicture.asset(
                                Constants.likeIcon,
                                colorFilter: const ColorFilter.mode(
                                    Constants.white, BlendMode.srcIn),
                                width: 20,
                                height: 20,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }
}
