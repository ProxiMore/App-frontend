import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:proximore/utils/constants.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        foregroundColor: Constants.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Constants.primaryBlue,
      ),
      body: Center(
        child: Text(
          'Settings Page',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
