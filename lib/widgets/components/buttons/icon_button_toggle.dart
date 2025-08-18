import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:proximore/utils/constants.dart';

class UIIconToggleButton extends StatefulWidget {
  final String icon;
  final Color color;
  final Color secondaryColor;
  final VoidCallback callback;
  final double size;
  final bool initialSelected;

  const UIIconToggleButton({
    super.key,
    required this.icon,
    this.color = Constants.black,
    this.secondaryColor = Constants.light,
    required this.callback,
    this.size = 28,
    this.initialSelected = false,
  });

  @override
  State<UIIconToggleButton> createState() => _UIIconToggleButtonState();
}

class _UIIconToggleButtonState extends State<UIIconToggleButton> {
  late bool isSelected;

  @override
  void initState() {
    super.initState();
    isSelected = widget.initialSelected;
  }

  void toggleSelection() {
    setState(() {
      isSelected = !isSelected;
    });
    widget.callback();
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: SvgPicture.asset(
        widget.icon,
        width: widget.size,
        colorFilter: ColorFilter.mode(
          !isSelected ? widget.color : widget.secondaryColor,
          BlendMode.srcIn,
        ),
      ),
      onPressed: toggleSelection,
    );
  }
}
