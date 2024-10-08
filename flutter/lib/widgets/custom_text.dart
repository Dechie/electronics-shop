import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;

  final Color color;
  double? size;
  CustomText({
    super.key,
    required this.text,
    required this.color,
    this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: size ?? 12,
        color: color,
        fontWeight: FontWeight.w700,
      ),
    );
  }
}
