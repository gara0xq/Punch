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
                  'Ali Ahmed',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 30),
                ProfileDetailsBox(
                  title: "Account Number",
                  //2
                  value: "100000032",
                ),
                ProfileDetailsBox(
                  title: "Username",
                  //3
                  value: "aliahmed1",
                ),
                ProfileDetailsBox(
                  title: "Email",
                  //4
                  value: "garaxq@gmail.com",
                ),
                ProfileDetailsBox(
                  title: "First Name",
                  //5
                  value: "Ali",
                ),
                ProfileDetailsBox(
                  title: "Lase Name",
                  //6
                  value: "Ahmed",
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
