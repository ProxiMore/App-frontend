import 'package:flutter/material.dart';
import 'package:proximore/utils/constants.dart';

class AddPostPage extends StatelessWidget {
  const AddPostPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Post'),
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
          'Add Post Page',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
