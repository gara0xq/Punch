import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:punch/controller/bottom_nav_controller.dart';
import 'package:punch/controller/home_controller.dart';
import 'package:punch/locale/local_controller.dart';
import 'package:punch/utils/colors.dart';
import 'package:punch/widgets/custom_text.dart';
import 'package:punch/widgets/lang_buttom.dart';
import 'package:punch/widgets/logout_button.dart';
import 'package:punch/widgets/sidebar_button.dart';

class SideBar extends StatefulWidget {
  SideBar({super.key});

  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  int _tabSelectedIndexSelected = 0;
  BottomNavController bottomNavController = Get.put(BottomNavController());

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
                  title: "profile".tr,
                  icon: Icons.person,
                  onTap: () {
                    bottomNavController.changeIndex(2);
                    Get.back();
                  },
                ),
                SidebarButton(
                  title: "transactions".tr,
                  icon: Icons.menu,
                  onTap: () {
                    Get.toNamed('/history');
                  },
                ),
                SidebarButton(
                  title: "transfer".tr,
                  icon: Icons.sync_alt_outlined,
                  onTap: () {
                    Get.toNamed('/transfer_request');
                  },
                ),
                SizedBox(
                  height: 50,
                ),
                LangButton(),
                SizedBox(
                  height: 100,
                ),
                Container(
                  margin: EdgeInsets.only(left: 15),
                  alignment: Alignment.bottomLeft,
                  child: LogoutButton(),
                ),
              ],
            );
          }),
    );
  }
}
