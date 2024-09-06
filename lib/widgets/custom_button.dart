import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomButton extends StatelessWidget {
  String text;
  void Function()? onPressed;
  CustomButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      minWidth: double.infinity,
      color: Colors.black,
      height: 60,
      textColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 15,
          fontFamily: "Raleway",
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
