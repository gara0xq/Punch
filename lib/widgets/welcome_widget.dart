import 'package:flutter/material.dart';

// ignore: must_be_immutable
class WelcomeWidget extends StatelessWidget {
  String text, image;
  WelcomeWidget({
    super.key,
    required this.text,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          image,
          scale: 1.2,
        ),
        const SizedBox(height: 50),
        Text(
          text,
          textAlign: TextAlign.center,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
      ],
    );
  }
}
