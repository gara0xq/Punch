import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomText extends StatelessWidget {
  String text;
  double fontSize;
  Color? color = Colors.white;
  FontWeight fontWeight;
  CustomText({
    super.key,
    required this.text,
    this.fontSize = 14,
    this.color,
    this.fontWeight = FontWeight.normal,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 14,
        fontFamily: 'Raleway',
        color: Color(0xffA31CFF),
        fontWeight: fontWeight,
      ),
    );
  }
}
