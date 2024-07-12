import 'package:flutter/material.dart';

import '../utils/constants.dart';

class RowText extends StatelessWidget {
  RowText({
    super.key,
    required this.leftText,
    required this.rightText,
    this.size,
  });

  final String leftText;
  final String rightText;
  double? size;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: [
          CustomText(
            text: leftText,
            color: mainBlack,
          ),
          const SizedBox(
            width: 10,
          ),
          CustomText(
            text: rightText,
            color: myOrange,
          ),
        ],
      ),
    );
  }
}

class CustomText extends StatelessWidget {
  CustomText({
    super.key,
    required this.text,
    required this.color,
    this.size,
  });

  final String text;
  final Color color;
  double? size;

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
