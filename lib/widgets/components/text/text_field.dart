import 'package:flutter/material.dart';
import 'package:proximore/utils/constants.dart';

class UITextField extends StatefulWidget {
  final void Function(String) onFieldSubmitted;
  final TextEditingController? controller;

  const UITextField({
    super.key,
    required this.labelText,
    required this.onFieldSubmitted,
    this.controller,
    this.labelColor = Constants.black,
    this.labelActifColor = Constants.black,
    this.fillColor = Constants.white,
    this.focusedBorderColor = Constants.black,
    this.enabledBorderColor = Constants.black,
    this.textColor = Constants.black,
    this.labelFloating = true,
  });

  final String labelText;
  final Color labelColor;
  final Color labelActifColor;
  final bool labelFloating;
  final Color fillColor;
  final Color focusedBorderColor;
  final Color enabledBorderColor;
  final Color textColor;

  @override
  State<UITextField> createState() => _UITextFieldState();
}

class _UITextFieldState extends State<UITextField> {
  late FocusNode myFocusNode;

  @override
  void initState() {
    super.initState();
    myFocusNode = FocusNode();
  }

  @override
  void dispose() {
    myFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      textCapitalization: TextCapitalization.none,
      focusNode: myFocusNode,
      decoration: InputDecoration(
        filled: true,
        fillColor: widget.fillColor,
        border: InputBorder.none,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(color: widget.focusedBorderColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(color: widget.enabledBorderColor),
        ),
        labelText: widget.labelText,
        labelStyle: TextStyle(color: widget.labelColor),
        floatingLabelBehavior: widget.labelFloating
            ? FloatingLabelBehavior.auto
            : FloatingLabelBehavior.never,
        floatingLabelStyle: widget.labelFloating
            ? TextStyle(color: widget.labelActifColor)
            : null,
      ),
      style: TextStyle(
        color: widget.textColor,
        fontSize: 16.0,
        fontFamily: Constants.secondaryFont,
      ),
      onFieldSubmitted: (value) {
        print("Texte soumis : $value");
        widget.onFieldSubmitted(value);
      },
    );
  }
}
