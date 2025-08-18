import 'package:flutter/material.dart';
import 'package:proximore/utils/constants.dart';

class SubscriptionMenuWidget extends StatefulWidget {
  final Function(int) onSelect; // Callback to notify the selection

  const SubscriptionMenuWidget({Key? key, required this.onSelect})
      : super(key: key);

  @override
  _SubscriptionMenuWidgetState createState() => _SubscriptionMenuWidgetState();
}

class _SubscriptionMenuWidgetState extends State<SubscriptionMenuWidget> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 18.0),
      decoration: BoxDecoration(
        border: Border.all(color: Constants.primaryBlue),
        borderRadius: BorderRadius.circular(12),
        color: Constants.primaryBlue,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = 0;
              });
              widget.onSelect(selectedIndex); // Notify HomePage
            },
            child: Text(
              'EXPLORER',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: selectedIndex == 0
                    ? Constants.secondaryOrange
                    : Colors.white,
                decoration: selectedIndex == 0
                    ? TextDecoration.underline
                    : TextDecoration.none,
                decorationColor: selectedIndex == 0
                    ? Constants.secondaryOrange
                    : Colors.transparent,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = 1;
              });
              widget.onSelect(selectedIndex); // Notify HomePage
            },
            child: Text(
              'FAVORIS',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: selectedIndex == 1
                    ? Constants.secondaryOrange
                    : Colors.white,
                decoration: selectedIndex == 1
                    ? TextDecoration.underline
                    : TextDecoration.none,
                decorationColor: selectedIndex == 1
                    ? Constants.secondaryOrange
                    : Colors.transparent,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
