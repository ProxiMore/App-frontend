import 'package:flutter/material.dart';
import 'package:proximore/utils/constants.dart';

class SearchWidget extends StatefulWidget {
  final void Function(String)? onChanged;
  final void Function(String)? onSubmitted;

  const SearchWidget({Key? key, this.onChanged, this.onSubmitted})
      : super(key: key);

  @override
  _SearchWidgetState createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 32.0, right: 22.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _controller,
              onChanged: widget.onChanged,
              onSubmitted: widget.onSubmitted,
              style: const TextStyle(color: Constants.white),
              decoration: InputDecoration(
                hintText: 'Rechercher',
                hintStyle: const TextStyle(color: Constants.primaryBeige),
                prefixIcon: const Icon(Icons.search, color: Constants.white),
                filled: true,
                fillColor: Constants.primaryBlue,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.symmetric(vertical: 12.0),
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              _controller.clear();
              if (widget.onChanged != null) {
                widget.onChanged!('');
              }
            },
            child: const Text(
              'ANNULER',
              style: TextStyle(fontSize: 16.0, color: Constants.black),
            ),
          ),
        ],
      ),
    );
  }
}
