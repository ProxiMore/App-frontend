import 'package:flutter/material.dart';
import 'package:proximore/utils/constants.dart';

import 'package:proximore/models/Chat.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:proximore/data_source/auth_service.dart';

class ChatBottomBar extends StatefulWidget {
  final void Function(String)? onChanged;
  final void Function(String)? onSubmitted;
  final Chat chat;

  const ChatBottomBar(
      {Key? key, required this.chat, this.onChanged, this.onSubmitted})
      : super(key: key);

  @override
  _ChatBottomBarState createState() => _ChatBottomBarState();
}

class _ChatBottomBarState extends State<ChatBottomBar> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: Constants.primaryBlue,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4,
              offset: Offset(0, -2),
            ),
          ],
        ),
        child: Row(
          children: [
            // Chat name
            Expanded(
              child: TextField(
                controller: _controller,
                onChanged: widget.onChanged,
                onSubmitted: widget.onSubmitted,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: "Type a message...",
                  hintStyle: const TextStyle(color: Colors.white70),
                  filled: true,
                  fillColor: Constants.primaryBlue.withOpacity(0.2),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 12),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),

            // Send button
            IconButton(
              icon: const Icon(Icons.send, color: Colors.white),
              onPressed: () {
                if (widget.onSubmitted != null &&
                    _controller.text.trim().isNotEmpty) {
                  widget.onSubmitted!(_controller.text.trim());
                  _controller.clear();
                }
              },
            ),
          ],
        ),
      ),
    );

    // return AppBar(
    //   title: Text(widget.chat.name),
    //   foregroundColor: Constants.white,
    //   leading: IconButton(
    //     icon: Icon(Icons.arrow_back),
    //     onPressed: () {
    //       Navigator.pop(context);
    //     },
    //   ),
    //   backgroundColor: Constants.primaryBlue,
    // );
  }
}
