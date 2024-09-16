import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:punch/controller/home_controller.dart';
import 'package:punch/widgets/delete_account_button.dart';
import 'package:punch/widgets/profile_details_box.dart';
import 'package:punch/widgets/logout_button.dart';

class ProfileScreen extends GetWidget<HomeController> {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Image.asset("assets/images/main_bg.png"),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                SizedBox(height: 120),
                SizedBox(
                  height: 120,
                  width: 120,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      const CircleAvatar(
                        radius: 200,
                        backgroundImage: AssetImage("assets/images/user.png"),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: CircleAvatar(
                          radius: 15,
                          backgroundColor: Colors.grey.shade100,
                          child: const Icon(
                            Icons.edit,
                            size: 20,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  //1
                  "Ali Ahmed",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 30),
                ProfileDetailsBox(
                  title: "account_number".tr,
                  //2
                  value: controller.CurrentUserModel.userAccountId,
                ),
                ProfileDetailsBox(
                  title: "username".tr,
                  //3
                  value: controller.CurrentUserModel.username,
                ),
                ProfileDetailsBox(
                  title: "email".tr,
                  //4
                  value: controller.CurrentUserModel.email,
                ),
                ProfileDetailsBox(
                  title: "first_name".tr,
                  //5
                  value: controller.CurrentUserModel.firstName,
                ),
                ProfileDetailsBox(
                  title: "last_name".tr,
                  //6
                  value: controller.CurrentUserModel.lastName,
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    DeleteAccountButton(),
                    LogoutButton(),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
