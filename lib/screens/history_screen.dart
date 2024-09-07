import 'package:flutter/material.dart';
import 'package:punch/widgets/custom_text.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          CustomText(text: "History", color: Colors.black),
        ],
      ),
    );
  }
}
