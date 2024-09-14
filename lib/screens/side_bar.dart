import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:punch/controller/home_controller.dart';
import 'package:punch/widgets/custom_text.dart';
import 'package:punch/widgets/sidebar_button.dart';

class SideBar extends StatelessWidget {
  const SideBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Color(0xffffffff),
      child: GetBuilder<HomeController>(
          init: HomeController(),
          builder: (controller) {
            return Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 60),
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.black,
                    ),
                    width: 150.0,
                    height: 150.0,
                    child: Center(
                      child: CustomText(
                        text: controller.CurrentUserModel.username[0],
                        color: Colors.white,
                        fontSize: 70,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  child: CustomText(
                    text: controller.CurrentUserModel.username,
                    color: Colors.black,
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  child: CustomText(
                    text: controller.CurrentUserModel.email,
                    color: Color(0xff5a5a5a),
                    fontSize: 15,
                  ),
                ),
                SizedBox(
                  height: 70,
                ),
                SidebarButton(
                  title: "Profile",
                  icon: Icons.person,
                  onTap: () {
                    Get.toNamed('/controller');
                  },
                ),
                SidebarButton(
                  title: "Transactions",
                  icon: Icons.menu,
                  onTap: () {
                    Get.toNamed('/history');
                  },
                ),
                SidebarButton(
                  title: "Tranfer",
                  icon: Icons.sync_alt_outlined,
                  onTap: () {
                    Get.toNamed('/transfer_request');
                  },
                ),
              ],
            );
          }),
    );
  }
}
