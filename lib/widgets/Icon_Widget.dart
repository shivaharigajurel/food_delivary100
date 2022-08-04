import 'package:flutter/material.dart';
import 'package:food_delivary/utilts/dimensions.dart';

class IconWidget extends StatelessWidget {
  final IconData icon;
  final Color backgroundColor;
  final Color iconColor;
  final double size;
  const IconWidget({
    Key? key,
    required this.icon,
    this.backgroundColor = const Color(0xFFccc7c5),
    this.iconColor = const Color(0xFF5c524f),
    this.size = 50,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(size / 2),
        color: backgroundColor,
      ),
      child: Icon(
        icon,
        color: iconColor,
        size: Dimensions.height16,
      ),
    );
  }
}
