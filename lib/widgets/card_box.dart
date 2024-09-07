import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CardBox extends StatelessWidget {
  double box_dimantion;
  Color gradiant_color;
  Alignment alignment;
  String card_name, image, card_num;
  CardBox({
    super.key,
    required this.box_dimantion,
    required this.gradiant_color,
    required this.alignment,
    required this.card_name,
    required this.image,
    required this.card_num,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: box_dimantion,
      width: box_dimantion,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: RadialGradient(
          center: alignment,
          radius: 0.8,
          colors: <Color>[
            gradiant_color,
            const Color(0xFF010101),
          ],
        ),
      ),
      child: Column(
        children: [
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                card_name,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 10,
                ),
              ),
              Image.asset(
                image,
                scale: 1.3,
              )
            ],
          ),
          const SizedBox(height: 20),
          Text(
            card_num,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
