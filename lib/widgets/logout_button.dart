import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class LogoutButton extends StatelessWidget {
  LogoutButton({super.key});
  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.black,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      icon: Icon(
        Icons.logout,
        color: Colors.white,
        size: 24,
      ),
      label: Text(
        'logout'.tr,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
