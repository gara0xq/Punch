import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:punch/controller/bottom_nav_controller.dart';
import 'package:punch/utils/colors.dart';
import 'package:punch/widgets/custom_text.dart';

class ControllerScreen extends StatelessWidget {
  ControllerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BottomNavController>(
        init: BottomNavController(),
        builder: (conteoller) {
          return Scaffold(
            body: conteoller.getPage(),
            bottomNavigationBar: Container(
              color: Colors.white,
              height: 75,
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      height: 65,
                      width: 65,
                      padding: EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            blurRadius: 10,
                          )
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: 55,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            blurRadius: 10,
                          )
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.transparent,
                                shadowColor: Colors.transparent,
                                overlayColor: Colors.transparent),
                            onPressed: () {
                              conteoller.changeIndex(0);
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Icon(
                                  Icons.home,
                                  size: 30,
                                  color: Colors.black,
                                ),
                                CustomText(
                                  text: "home".tr,
                                  fontSize: 14,
                                  color: Colors.black,
                                )
                              ],
                            ),
                          ),
                          SizedBox(),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.transparent,
                                shadowColor: Colors.transparent,
                                overlayColor: Colors.transparent),
                            onPressed: () {
                              conteoller.changeIndex(2);
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Image.asset(
                                  'assets/icons/user.png',
                                  scale: 1.3,
                                ),
                                CustomText(
                                  text: "profile".tr,
                                  fontSize: 14,
                                  color: Colors.black,
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          shadowColor: Colors.transparent,
                          overlayColor: Colors.transparent),
                      onPressed: () {
                        conteoller.changeIndex(1);
                      },
                      child: Container(
                        height: 65,
                        width: 65,
                        padding: EdgeInsets.all(3),
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: RadialGradient(
                              colors: [Colors.black, Colors.black, cayan],
                              radius: 1.3,
                              center: Alignment.topRight,
                            ),
                            shape: BoxShape.circle,
                          ),
                          child: Image.asset(
                            'assets/icons/apps.png',
                            scale: 1.2,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
