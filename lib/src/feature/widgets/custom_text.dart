import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    required this.content,
    this.fontWeight = FontWeight.normal,
    this.size = 20,
    this.isLink = false,
    super.key,
  });

  final String content;
  final FontWeight fontWeight;
  final double size;
  final bool isLink;

  @override
  Widget build(BuildContext context) {
    return Text(
      content,
      style: TextStyle(
        color: isLink ? Colors.blue : Colors.white,
        fontSize: size,
        fontWeight: fontWeight,
        decoration: isLink ? TextDecoration.underline : TextDecoration.none,
      ),
    );
  }
}
