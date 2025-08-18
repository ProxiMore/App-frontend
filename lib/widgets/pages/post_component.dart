import 'package:flutter/material.dart';
import '../../utils/constants.dart';
import '../components/posts/post_card.dart';

class PostComponent extends StatelessWidget {
  const PostComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Constants.primaryBeige,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Placeholder(), //UIPostCard(post: null),
          ),
        ));
  }
}
