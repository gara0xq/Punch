import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:punch/controller/home_controller.dart';
import 'package:punch/controller/prefs_controller.dart';
import 'package:punch/utils/colors.dart';
import 'package:punch/widgets/card_box.dart';
import 'package:punch/widgets/custom_text.dart';
import 'package:punch/widgets/fast_action_button.dart';
import 'package:punch/widgets/transaction_item.dart';
import 'side_bar.dart';

// ignore: must_be_immutable
class HomeScreen extends GetWidget<HomeController> {
  HomeScreen({super.key});

  HomeController homeController = Get.put(HomeController());
  PrefsController prefsController = Get.find<PrefsController>();
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double boxDimantion = width / 3 - 40;
    final GlobalKey<ScaffoldState> _scaffoldKey =
        new GlobalKey<ScaffoldState>();
    return Scaffold(
      key: _scaffoldKey,
      drawer: SideBar(),
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Image.asset("assets/images/main_bg.png"),
          GetBuilder<HomeController>(
            init: HomeController(),
            builder: (controller) {
              return !controller.loading.value
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : Padding(
                      padding: const EdgeInsets.all(20),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            const SizedBox(height: 70),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(
                                  text: 'home'.tr,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                                CustomText(
                                  text: controller.CurrentUserModel.balance,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: const Color.fromARGB(255, 16, 16, 237),
                                ),
                                Row(
                                  children: [
                                    const Icon(Icons.remove_red_eye_outlined,
                                        size: 20),
                                    const SizedBox(width: 5),
                                    CustomText(
                                      text: 'current_balance'.tr,
                                      fontSize: 16,
                                      color: Colors.black,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                FastActionButton(
                                  color: const Color(0xFF4C52EE),
                                  title: "add_money".tr,
                                  image: "assets/icons/add.png",
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Get.toNamed("/transfer_request");
                                  },
                                  child: FastActionButton(
                                    color: Color.fromARGB(255, 92, 109, 114),
                                    title: "transfer".tr,
                                    image: "assets/icons/transaction.png",
                                  ),
                                ),
                                FastActionButton(
                                  color: Colors.white,
                                  title: "pay_bills".tr,
                                  image: "assets/icons/bill.png",
                                ),
                              ],
                            ),
                            //d
                            const SizedBox(height: 20),
                            Container(
                              width: width,
                              padding: const EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white,
                                boxShadow: const [
                                  BoxShadow(
                                      color: Colors.grey,
                                      blurRadius: 7,
                                      spreadRadius: -1),
                                ],
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      CustomText(
                                        text: "my_cards".tr,
                                        color: Colors.black,
                                        fontSize: 20,
                                      ),
                                      CustomText(
                                        // text: "See More >",
                                        text: "${"see_more".tr} >",
                                        color: const Color(0xFF1B8CB0),
                                        fontSize: 14,
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      CardBox(
                                        box_dimantion: boxDimantion,
                                        gradiant_color: const Color(0xFFFF088C),
                                        alignment: Alignment.bottomLeft,
                                        card_name: "S-Card",
                                        image: "assets/icons/visa.png",
                                        card_num: "****4754",
                                      ),
                                      CardBox(
                                        box_dimantion: boxDimantion,
                                        gradiant_color: const Color(0xFFA31CFF),
                                        alignment: Alignment.topRight,
                                        card_name: "M-Card",
                                        image: "assets/icons/masterCard.png",
                                        card_num: "****8988 ",
                                      ),
                                      CardBox(
                                        box_dimantion: boxDimantion,
                                        gradiant_color: const Color(0xFF1ABAE4),
                                        alignment: Alignment.centerRight,
                                        card_name: "X-Card",
                                        image: "assets/icons/visa.png",
                                        card_num: "****6319",
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 20),
                            Container(
                              padding: const EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: const [
                                  BoxShadow(
                                      color: Colors.grey,
                                      blurRadius: 7,
                                      spreadRadius: -1),
                                ],
                              ),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      CustomText(
                                        text: "transactions".tr,
                                        color: Colors.black,
                                        fontSize: 20,
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          Get.toNamed("/history");
                                        },
                                        child: CustomText(
                                          text: "${"see_more".tr} >",
                                          color: const Color(0xFF1B8CB0),
                                          fontSize: 14,
                                        ),
                                      ),
                                    ],
                                  ),
                                  TransactionItem(
                                    icon: const Icon(Icons.discord),
                                    title: 'Discord',
                                    status: "failed".tr,
                                    amount: 'USD 20.00',
                                    date: "date1".tr, //"November 25, 2023"
                                    backgroundColor: Colors.purple[100]!,
                                  ),
                                  TransactionItem(
                                    icon: const Icon(Icons.email),
                                    title: 'Gmail',
                                    status: "completed".tr,
                                    amount: 'USD 86.00',
                                    date: "date2".tr, //"October 18, 2023"
                                    backgroundColor: Colors.purple[100]!,
                                  ),
                                  TransactionItem(
                                    icon: const Icon(Icons.facebook),
                                    title: 'Facebook',
                                    status: "completed".tr,
                                    amount: 'EGP 3500.00',
                                    date: "date3".tr, //"April 21, 2023"
                                    backgroundColor: Colors.purple[100]!,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
            },
          ),
          GestureDetector(
            onTap: () {
              return _scaffoldKey.currentState!.openDrawer();
            },
            child: Container(
              margin: EdgeInsets.only(top: 30, left: 20),
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                  color: blue, borderRadius: BorderRadius.circular(10)),
              child: Icon(
                Icons.menu,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}
