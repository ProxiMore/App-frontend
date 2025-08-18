import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:proximore/data_source/data.dart';
import 'package:proximore/models/Post.dart';
import 'package:proximore/models/User.dart';
import 'package:proximore/utils/constants.dart';
import 'package:proximore/widgets/components/user/profile_card.dart';
import 'package:proximore/widgets/components/buttons/icon_button.dart';

import 'package:proximore/widgets/components/text/text_field.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:proximore/data_source/auth_service.dart';

class NewPostPage extends StatelessWidget {
  NewPostPage({super.key});

  final TextEditingController _commentController = TextEditingController();

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  Future<void> handlePost(BuildContext context) async {
    final url = Uri.parse('https://app-backend-jhpm.onrender.com/api/posts');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        "user_id": AuthService().userId.toString(),
        "title": _titleController.text,
        "content": _contentController.text,
        "address": _addressController.text,
      }),
    );
    if (response.statusCode == 201) {
      print('Post created: ${response.body}');
      context.pop();
    } else {
      print('Failed to create post: ${response.body}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.primaryBeige,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom / 3,
          ),
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                child: Column(
                  children: [
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          child: Text(
                            Constants.cancel.toUpperCase(),
                            style: TextStyle(
                              color: Constants.darkest,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          onPressed: () {
                            context.pop();
                          },
                        ),
                        TextButton(
                          child: Text(
                            Constants.publish.toUpperCase(),
                            style: TextStyle(
                              color: Constants.darkest,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          onPressed: () {
                            handlePost(context);
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: 30),
                    ProfileCard(
                      image: 'assets/images/profile4.jpg',
                      title: '@clara_music',
                    ),
                    FractionallySizedBox(
                      widthFactor: 0.75,
                      child: SizedBox(
                        height: (MediaQuery.of(context).size.height * 0.05),
                        child: UITextField(
                          labelText: "Titre",
                          controller: _titleController,
                          labelColor: Constants.secondaryOrange,
                          labelFloating: false,
                          fillColor: Constants.white,
                          focusedBorderColor: Constants.secondaryOrange,
                          enabledBorderColor: Constants.white,
                          textColor: Constants.secondaryOrange,
                          onFieldSubmitted: (value) {},
                        ),
                      ),
                    ),
                    SizedBox(
                        height: (MediaQuery.of(context).size.height * 0.02)),
                    FractionallySizedBox(
                      widthFactor: 0.75,
                      child: SizedBox(
                        height: (MediaQuery.of(context).size.height * 0.05),
                        child: UITextField(
                          labelText: "Adresse",
                          controller: _addressController,
                          labelColor: Constants.secondaryOrange,
                          labelFloating: false,
                          fillColor: Constants.white,
                          focusedBorderColor: Constants.secondaryOrange,
                          enabledBorderColor: Constants.white,
                          textColor: Constants.secondaryOrange,
                          onFieldSubmitted: (value) {},
                        ),
                      ),
                    ),
                    SizedBox(
                        height: (MediaQuery.of(context).size.height * 0.02)),
                    TextField(
                      controller: _contentController,
                      autofocus: true,
                      maxLines: 4,
                      style: TextStyle(fontFamily: Constants.secondaryFont),
                      decoration: InputDecoration.collapsed(
                        hintText: "Détails du post...",
                      ),
                    ),
                    SizedBox(
                        height: (MediaQuery.of(context).size.height * 0.02)),
                  ],
                ),
              ),
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20), // Image border
                    child: SizedBox.fromSize(
                      size: Size.fromRadius((MediaQuery.sizeOf(context).width) /
                          2), // Image radius
                      child: Image.network(
                          'https://www.proedsolutions.com/wp-content/themes/micron/images/placeholders/placeholder_large_dark.jpg',
                          fit: BoxFit.cover),
                    ),
                  ),
                  Positioned(
                    bottom: 25, // Positionner les icônes en bas
                    left: 70,
                    right: 70,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        UIIconButton(
                          icon: Constants.soundIcon,
                          color: Constants.primaryBeige,
                          callback: () {},
                        ),
                        UIIconButton(
                          icon: Constants.cameraIcon,
                          color: Constants.primaryBeige,
                          callback: () {},
                        ),
                        UIIconButton(
                          icon: Constants.replayIcon,
                          color: Constants.primaryBeige,
                          callback: () {},
                        ),
                        UIIconButton(
                          icon: Constants.pictureIcon,
                          color: Constants.primaryBeige,
                          callback: () {},
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
