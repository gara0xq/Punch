import 'package:flutter/material.dart';

// ignore: must_be_immutable
class FastActionButton extends StatelessWidget {
  Color color;
  String title, image;

  FastActionButton({
    super.key,
    required this.color,
    required this.title,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 70,
          width: 70,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
          child: Image.asset(image),
        ),
        const SizedBox(height: 10),
        Text(
          title,
          style: const TextStyle(
            fontSize: 14,
            fontFamily: "Raleway",
          ),
        ),
      ],
    );
  }
}
