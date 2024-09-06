import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomAuthBackground extends StatelessWidget {
  Widget child;
  CustomAuthBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const Positioned(
            top: -40,
            left: -50,
            child: CircleAvatar(
              radius: 85,
              backgroundColor: Color(0xFF810E4E),
            )),
        const Positioned(
            // Second Circle
            top: 85,
            right: -50,
            child: CircleAvatar(
              radius: 95,
              backgroundColor: Color(0xFF1C7997),
            )),
        const Positioned(
          top: 85,
          right: 20,
          left: 15,
          child: Text(
            "PUNCH",
            style: TextStyle(
                fontFamily: "Raleway",
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 43),
            textAlign: TextAlign.center,
          ),
        ),
        const Positioned(
          top: 140,
          right: 20,
          left: 15,
          child: Text(
            "Punch - Earn - Repeat",
            style: TextStyle(
                fontFamily: "Raleway",
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: 12),
            textAlign: TextAlign.center,
          ),
        ),
        child,
      ],
    );
  }
}
