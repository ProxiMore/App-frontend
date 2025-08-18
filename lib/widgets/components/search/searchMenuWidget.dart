import 'package:flutter/material.dart';
import 'package:proximore/utils/constants.dart';

class SearchMenuWidget extends StatefulWidget {
  final Function(int) onSelect;

  const SearchMenuWidget({Key? key, required this.onSelect}) : super(key: key);

  @override
  _SearchMenuWidgetState createState() => _SearchMenuWidgetState();
}

class _SearchMenuWidgetState extends State<SearchMenuWidget> {
  int selectedIndex = 0; // Par défaut, le premier bouton est sélectionné

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 18.0),
      decoration: BoxDecoration(
        border: Border.all(color: Constants.primaryBlue),
        borderRadius: BorderRadius.circular(12),
        color: Constants.primaryBlue,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // Bouton RECENT
          GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = 0;
              });
              widget.onSelect(selectedIndex);
            },
            child: Text(
              'RECENT',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: selectedIndex == 0
                    ? Constants.secondaryOrange
                    : Colors.white,
                decoration: selectedIndex == 0
                    ? TextDecoration.underline
                    : TextDecoration.none,
              ),
            ),
          ),
          // Bouton MUSIQUE
          GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = 1;
              });
              widget.onSelect(selectedIndex);
            },
            child: Text(
              'MUSIQUE',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: selectedIndex == 1
                    ? Constants.secondaryOrange
                    : Colors.white,
                decoration: selectedIndex == 1
                    ? TextDecoration.underline
                    : TextDecoration.none,
              ),
            ),
          ),
          // Bouton AMIS
          GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = 2;
              });
              widget.onSelect(selectedIndex);
            },
            child: Text(
              'AMIS',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: selectedIndex == 2
                    ? Constants.secondaryOrange
                    : Colors.white,
                decoration: selectedIndex == 2
                    ? TextDecoration.underline
                    : TextDecoration.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
