import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:proximore/utils/constants.dart';

class UIIconButton extends StatelessWidget {
  final String icon;
  final Color color;
  final VoidCallback callback;
  final double size;

  const UIIconButton({
    super.key,
    required this.icon,
    this.color = Constants.black,
    required this.callback,
    this.size = 28,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: SvgPicture.asset(
        icon,
        width: size,
        colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
      ),
      onPressed: callback,
    );
  }
}
