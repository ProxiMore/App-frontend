import 'package:flutter/material.dart';
import 'package:proximore/utils/constants.dart';
import 'package:go_router/go_router.dart';

class PostBtnAddWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          context.go('/addPost');
        },
        child: Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Constants.primaryBlue,
          ),
          child: Center(
            child: Icon(
              Icons.add,
              size: 38.0,
              color: Constants.white,
            ),
          ),
        ),
      ),
    );
  }
}
