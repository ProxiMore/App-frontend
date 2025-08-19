import 'package:flutter/material.dart';
import 'package:proximore/utils/constants.dart';

import 'package:proximore/models/Chat.dart';

class ChatTopBar extends StatefulWidget {
  final void Function(String)? onChanged;
  final void Function(String)? onSubmitted;
  final Chat chat;

  const ChatTopBar(
      {Key? key, required this.chat, this.onChanged, this.onSubmitted})
      : super(key: key);

  @override
  _ChatTopBarState createState() => _ChatTopBarState();
}

class _ChatTopBarState extends State<ChatTopBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(widget.chat.name),
      foregroundColor: Constants.white,
      leading: IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      backgroundColor: Constants.primaryBlue,
    );
  }
}
