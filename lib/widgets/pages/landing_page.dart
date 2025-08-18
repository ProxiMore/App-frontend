import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:proximore/utils/constants.dart';
import 'package:proximore/widgets/components/buttons/button.dart';
import 'package:proximore/widgets/components/text/text_field.dart';
import 'package:proximore/router/router.dart';
import 'package:proximore/widgets/pages/home_page.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final List<String> icons = [
    Constants.addIcon,
    Constants.cameraIcon,
    Constants.closeIcon,
    Constants.exportIcon,
    Constants.gifIcon,
    Constants.homeIcon,
    Constants.likeIcon,
    Constants.messageIcon,
    Constants.musicNoteIcon,
    Constants.nextIcon,
    Constants.parameterIcon,
    Constants.phoneIcon,
    Constants.personIcon,
    Constants.pictureIcon,
    Constants.playIcon,
    Constants.pointsIcon,
    Constants.previousIcon,
    Constants.replayIcon,
    Constants.searchIcon,
    Constants.soundIcon,
    Constants.starIcon,
    Constants.validationIcon,
    Constants.videoCameraIcon,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: const EdgeInsets.symmetric(vertical: 50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                UIButton(
                  text: 'Go to /home',
                  backgroundColor: Constants.secondaryOrange,
                  textColor: Constants.white,
                  onPressed: () {
                    context.push('/home');
                  },
                ),
                SizedBox(height: 20),
                UIButton(
                  text: 'Go to /new-post',
                  textColor: Constants.secondaryOrange,
                  onPressed: () {
                    context.push('/new-post');
                  },
                ),
                SizedBox(height: 20),
                UIButton(
                  text: 'Go to /post-component',
                  textColor: Constants.secondaryOrange,
                  onPressed: () {
                    context.push('/post-component');
                  },
                ),
                SizedBox(height: 20),
                UIButton(
                  text: 'Go to /new-text',
                  textColor: Constants.secondaryOrange,
                  onPressed: () {
                    context.push('/new-text');
                  },
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 120),
                    child: GridView.count(
                      crossAxisCount: 5,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      children: List.generate(icons.length, (index) {
                        return SvgPicture.asset(icons[index],
                            colorFilter: const ColorFilter.mode(
                              Colors.black,
                              BlendMode.srcIn,
                            ));
                      }),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                UIButton(
                  text: 'VALIDER',
                  textColor: Constants.secondaryOrange,
                  onPressed: () {
                    // ignore: avoid_print
                    print('Action du boutton VALIDER');
                  },
                ),
                SizedBox(height: 20),
                UITextField(
                  labelText: "Connexion",
                  labelColor: Constants.secondaryOrange,
                  labelActifColor: Constants.secondaryOrange,
                  fillColor: Constants.white,
                  focusedBorderColor: Constants.secondaryOrange,
                  enabledBorderColor: Constants.white,
                  textColor: Constants.secondaryOrange,
                  onFieldSubmitted: (value) {
                    print("value $value");
                  },
                ),
                SizedBox(height: 20),
                UITextField(
                  labelText: "Connexion",
                  onFieldSubmitted: (value) {
                    print("value $value");
                  },
                ),
                SizedBox(height: 20),
                Expanded(
                  child: GridView.count(
                    crossAxisCount: 10,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    children: List.generate(icons.length, (index) {
                      return SvgPicture.asset(icons[index],
                          colorFilter: const ColorFilter.mode(
                            Colors.black,
                            BlendMode.srcIn,
                          ));
                    }),
                  ),
                ),
              ],
            )));
  }
}
