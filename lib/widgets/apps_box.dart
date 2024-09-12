import 'package:flutter/material.dart';
import 'package:punch/widgets/custom_text.dart';

// ignore: must_be_immutable
class AppsBox extends StatelessWidget {
  String image, title;
  double scale;
  void Function()? onPressed;
  AppsBox({
    super.key,
    required this.image,
    required this.title,
    this.scale = 0.8,
    this.onPressed = null,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        overlayColor: Colors.transparent,
        padding: EdgeInsets.all(0),
      ),
      onPressed: onPressed,
      child: Container(
        height: 180,
        width: 180,
        padding: EdgeInsets.symmetric(vertical: 30),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 32, 32, 32),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(image, scale: scale),
            CustomText(
              text: title,
              fontSize: 20,
            )
          ],
        ),
      ),
    );
  }
}
