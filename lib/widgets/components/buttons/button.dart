import 'package:flutter/material.dart';
import 'package:proximore/utils/constants.dart';
import 'package:auto_size_text/auto_size_text.dart';

class UIButton extends StatelessWidget {
  const UIButton(
      {super.key,
      required this.text,
      required this.onPressed,
      this.backgroundColor = Constants.white,
      this.borderRadius = 10.0,
      this.maxTextSize = 18,
      this.minTextSize = 10,
      this.textColor = Constants.black,
      this.width});

  final String text;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final double borderRadius;
  final double? maxTextSize;
  final double? minTextSize;
  final Color textColor;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.all(5.0),
        backgroundColor: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
      onPressed: onPressed,
      child: AutoSizeText(
        text,
        style: TextStyle(
          fontSize: maxTextSize,
          color: textColor,
        ),
        maxLines: 1,
        minFontSize: minTextSize!,
      ),
    );
  }
}
