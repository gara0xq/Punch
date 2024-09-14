import 'package:flutter/material.dart';
import 'package:punch/widgets/custom_text.dart';

// ignore: must_be_immutable
class ProfileDetailsBox extends StatelessWidget {
  String title, value;
  ProfileDetailsBox({
    super.key,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      padding: EdgeInsets.symmetric(horizontal: 20),
      margin: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 10,
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomText(
            text: title,
            color: Colors.grey.shade700,
          ),
          CustomText(
            text: value,
            color: Colors.grey.shade700,
          ),
        ],
      ),
    );
  }
}
