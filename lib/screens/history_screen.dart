import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:punch/controller/history_controller.dart';
import 'package:punch/controller/home_controller.dart';
import 'package:punch/controller/user_payments.dart';
import 'package:punch/utils/colors.dart';
import 'package:punch/widgets/custom_text.dart';
import 'package:punch/widgets/sub_screens_background.dart';

// ignore: must_be_immutable
class HistoryScreen extends GetWidget<HistoryController> {
  HistoryScreen({super.key});

  HomeController _homeController = Get.put(HomeController());
  final HistoryController historyController = Get.put(HistoryController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SubScreensBackground(
        child: GetBuilder<UserPaymentsController>(
            init: UserPaymentsController(),
            builder: (c) {
              return Container(
                height: double.infinity,
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 40),
                    Center(
                      child: CustomText(
                        text: "history".tr,
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(height: 40),
                    Container(
                      height: 70,
                      width: 100,
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.grey,
                            spreadRadius: 1,
                            blurRadius: 10,
                          )
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CustomText(
                            text: "date".tr,
                            color: Colors.black,
                          ),
                          Row(
                            children: [
                              Image.asset(
                                "assets/icons/calender.png",
                                scale: 8,
                              ),
                              SizedBox(width: 5),
                              CustomText(
                                text: "may".tr,
                                color: Colors.black,
                                fontSize: 18,
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        Container(
                          height: 70,
                          width: 150,
                          padding: const EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            color: blue,
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.grey,
                                spreadRadius: 1,
                                blurRadius: 10,
                              )
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CustomText(
                                    text: "income".tr,
                                    fontSize: 18,
                                  ),
                                  Image.asset('assets/icons/inArrow.png',
                                      scale: 13),
                                ],
                              ),
                              CustomText(
                                fontSize: 18,
                                text: "\$20,362",
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 20),
                        Container(
                          height: 70,
                          width: 150,
                          padding: const EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            color: Color(0xff00A0D2),
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.grey,
                                spreadRadius: 1,
                                blurRadius: 10,
                              )
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CustomText(
                                    text: "outcome".tr,
                                    fontSize: 18,
                                  ),
                                  Image.asset('assets/icons/outArrow.png',
                                      scale: 13),
                                ],
                              ),
                              CustomText(
                                fontSize: 18,
                                text: "\$6,830",
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 20),
                    !c.loading.value
                        ? Center(
                            child: CircularProgressIndicator(),
                          )
                        : Expanded(
                            child: Obx(
                              () => ListView.builder(
                                controller: historyController.scrollController,
                                itemCount: historyController
                                            .itemsToDisplay.value >
                                        c.userPaymets.length
                                    ? c.userPaymets.length
                                    : historyController.itemsToDisplay
                                        .value, // Show only the itemsToDisplay number
                                itemBuilder: (_, i) {
                                  log(c.userPaymets.length.toString());

                                  String amount =
                                      c.userPaymets[i].paymentAmount;

                                  String receiverAccountNumber =
                                      c.userPaymets[i].receiverAccountNumber;

                                  String receiverAccountName = _homeController
                                      .fetchUserData(receiverAccountNumber)
                                      .username;

                                  return Container(
                                    margin: EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 10),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: Colors.white,
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey,
                                            offset: Offset(0, 1),
                                            blurRadius: 10,
                                          )
                                        ]),
                                    child: ListTile(
                                      leading: Container(
                                        width: 50,
                                        height: 50,
                                        decoration: BoxDecoration(
                                          color: blue,
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                        child: Center(
                                          child: CustomText(
                                            text: receiverAccountName[0],
                                            fontSize: 26,
                                          ),
                                        ),
                                      ),
                                      subtitle: CustomText(
                                        text: amount,
                                        color: Colors.black,
                                      ),
                                      title: CustomText(
                                        text: receiverAccountName,
                                        color: Colors.black,
                                        fontSize: 20,
                                      ),
                                      trailing: Image.asset(
                                        'assets/icons/outArrow.png',
                                        scale: 13,
                                        color: Colors.black,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                  ],
                ),
              );
            }),
      ),
    );
  }
}
