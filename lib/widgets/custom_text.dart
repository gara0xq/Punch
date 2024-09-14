import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomText extends StatelessWidget {
  String text;
  double fontSize;
  Color color;
  FontWeight fontWeight;
  CustomText({
    super.key,
    required this.text,
    this.fontSize = 14,
    this.color = Colors.white,
    this.fontWeight = FontWeight.normal,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      textAlign: TextAlign.center,
      text,
      style: TextStyle(
        fontSize: fontSize,
        fontFamily: 'Raleway',
        color: color,
        fontWeight: fontWeight,
      ),
    );
  }
}
