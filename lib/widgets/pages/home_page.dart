import 'package:flutter/material.dart';
import 'package:proximore/widgets/components/posts/postBtnAdd.dart';
import 'package:proximore/widgets/components/posts/post_card.dart';
import 'package:proximore/widgets/components/subscription/subMenuWidget.dart';
import 'package:proximore/utils/constants.dart';
import 'package:proximore/models/Post.dart';
import 'package:proximore/models/User.dart';

import 'package:proximore/widgets/components/search/searchTextFieldWidget.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:proximore/data_source/auth_service.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isFavorisSelected = false;
  String searchText = '';

  List<Post> posts = [];

  Future<void> handleGetPosts(String? search) async {
    final url = (search != null && search.isNotEmpty
        ? Uri.parse(
            'https://app-backend-jhpm.onrender.com/api/posts/content/$search')
        : Uri.parse('https://app-backend-jhpm.onrender.com/api/posts'));

    final response = await http.get(
      url,
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      final List<dynamic> jsonList = jsonDecode(response.body);
      setState(() {
        posts = jsonList.map((json) => Post.fromJson(json)).toList();
      });
      print('Posts fetched !');
      // print('Posts fetched: ${response.body}');
    } else {
      print('Failed to fetch posts: ${response.body}');
    }
  }

  @override
  void initState() {
    super.initState();
    handleGetPosts(null);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.lightest,
      body: Stack(
        children: [
          Column(
            children: [
              // Menu "Explorer" et "Favoris"
              Padding(
                padding: const EdgeInsets.all(14.0),
                child: SubscriptionMenuWidget(
                  onSelect: (index) {
                    setState(() {
                      isFavorisSelected =
                          (index == 1); // isFavorisSelected true si index == 1
                    });
                  },
                ),
              ),
              // BARRE DE RECHERCHE
              SearchWidget(
                onChanged: (value) {
                  setState(() {
                    searchText = value;
                  });
                },
                onSubmitted: (value) {
                  setState(() {
                    searchText = value;
                  });
                  handleGetPosts(value);
                },
              ),
              // Liste de Posts
              Expanded(
                child: ListView.builder(
                  itemCount: posts.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: UIPostCard(post: posts[index]),
                    );
                  },
                ),
              ),
            ],
          ),
          // Bouton flottant en bas à droite
          Positioned(
            bottom: 16.0,
            right: 16.0,
            child: PostBtnAddWidget(),
          ),
        ],
      ),
    );
  }
}
