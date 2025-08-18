import 'package:flutter/material.dart';
import 'package:proximore/widgets/components/bars/topBarWidget.dart';
import 'package:proximore/widgets/pages/home_page.dart';
import 'package:proximore/widgets/pages/map_page.dart';
import 'package:proximore/widgets/pages/messagerie_page.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:proximore/widgets/pages/profil_page.dart';
import 'package:proximore/utils/constants.dart';

class NavigationExample extends StatefulWidget {
  const NavigationExample({super.key});

  @override
  State<NavigationExample> createState() => _NavigationExampleState();
}

class _NavigationExampleState extends State<NavigationExample> {
  int currentPageIndex = 0; // L'index de la page actuelle

  // Liste des pages à afficher
  final List<Widget> _pages = [
    MapPage(),
    HomePage(), // La page de recherche
    MessageriePage(),
    //ProfilPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopBarWidget(
        pathProfil: 'assets/images/profile4.jpg',
      ),
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        backgroundColor: Constants.lightest,
        //indicatorColor: Colors.amber,
        selectedIndex: currentPageIndex,
        destinations: <Widget>[
          NavigationDestination(
            selectedIcon: SvgPicture.asset(
              'assets/icons/search.svg',
              height: 24,
              width: 24,
              color: Constants.secondaryOrange,
            ),
            icon: SvgPicture.asset(
              'assets/icons/search.svg',
              height: 24,
              width: 24,
            ),
            label: 'Map',
          ),
          NavigationDestination(
            selectedIcon: SvgPicture.asset(
              'assets/icons/home.svg',
              height: 24,
              width: 24,
              color: Constants.secondaryOrange,
            ),
            icon: SvgPicture.asset(
              'assets/icons/home.svg',
              height: 24,
              width: 24,
            ),
            label: 'Annonces',
          ),
          NavigationDestination(
            selectedIcon: SvgPicture.asset(
              'assets/icons/message.svg',
              height: 24,
              width: 24,
              color: Constants.secondaryOrange,
            ),
            icon: SvgPicture.asset(
              'assets/icons/message.svg',
              height: 24,
              width: 24,
            ),
            label: 'Messagerie',
          ),
          /*
          NavigationDestination(
            selectedIcon: SvgPicture.asset(
              'assets/icons/person.svg',
              height: 24,
              width: 24,
              color: Constants.secondaryOrange,
            ),
            icon: SvgPicture.asset(
              'assets/icons/person.svg',
              height: 24,
              width: 24,
            ),
            label: 'Profil',
          ),
          */
        ],
      ),
      body: _pages[currentPageIndex],
    );
  }
}
