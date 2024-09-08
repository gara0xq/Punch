import 'package:flutter/material.dart';
import 'package:punch/utils/colors.dart';

class SubScreensBackground extends StatelessWidget {
  Widget child;
  SubScreensBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const Positioned(
          top: 400,
          left: -90,
          child: CircleAvatar(
            radius: 95,
            backgroundColor: pink,
          ),
        ),
        const Positioned(
          top: 70,
          right: -140,
          child: CircleAvatar(
            radius: 130,
            backgroundColor: cayan,
          ),
        ),
        const Positioned(
          top: 700,
          right: -60,
          child: CircleAvatar(
            radius: 60,
            backgroundColor: blue,
          ),
        ),
        Container(
          height: 45,
          width: 45,
          margin: EdgeInsets.only(top: 30, left: 15),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: blue,
          ),
          child: BackButton(
            color: Colors.white,
          ),
        ),
        child,
      ],
    );
  }
}
