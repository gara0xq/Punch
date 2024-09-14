import 'package:flutter/material.dart';
import 'package:punch/widgets/custom_text.dart';

// ignore: must_be_immutable
class SidebarButton extends StatelessWidget {
  String title;
  IconData icon;
  void Function()? onTap;
  SidebarButton(
      {super.key,
      required this.title,
      required this.icon,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ListTile(
        title: CustomText(
          text: title,
          color: Colors.black,
        ),
        leading: Icon(
          icon,
          color: Colors.black,
        ),
        titleAlignment: ListTileTitleAlignment.center,
      ),
    );
  }
}
