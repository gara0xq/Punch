import 'package:flutter/material.dart';
import 'package:punch/widgets/custom_text.dart';

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
    // Container(
    //   margin: EdgeInsets.only(top: 15),
    //   height: 50,
    //   width: 300,
    //   decoration: BoxDecoration(
    //     color: Color(0xfff4f4f4),
    //   ),
    //   child: TextButton(
    //     onPressed: () {},
    //     style: TextButton.styleFrom(
    //       foregroundColor: Colors.black,
    //       padding: EdgeInsets.zero,
    //     ),
    //     child: Row(
    //       children: [
    //         SizedBox(
    //           width: 5,
    //         ),
    //         Icon(icon, size: 30, color: Colors.black),
    //         SizedBox(
    //           width: 95,
    //         ),
    //         Text(
    //           title,
    //           style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
    //         ),
    //       ],
    //     ),
    //   ),
    // );
  }
}
