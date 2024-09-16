import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:punch/controller/auth_controller.dart';
import 'package:punch/controller/prefs_controller.dart';

class DeleteAccountButton extends StatelessWidget {
  DeleteAccountButton({super.key});
  final authController = Get.put(AuthController());
  final prefsController = Get.find<PrefsController>();
  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {
        authController.deletAccount();
        prefsController.deleteUser();
        Get.offAllNamed("/login");
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.red,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      icon: Icon(
        Icons.delete,
        color: Colors.white,
        size: 24,
      ),
      label: Text(
        'delete_account'.tr,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
