import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:punch/controller/user_payments.dart';

class HistoryController extends GetxController {
  final scrollController = ScrollController();
  final itemsToDisplay = 10.obs;
  final UserPaymentsController userPaymentsController =
      Get.put(UserPaymentsController());

  @override
  void onInit() {
    scrollController.addListener(() {
      // Check if we reached the end of the list
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        // Fetch more data by increasing the number of displayed items
        Future.delayed(Duration(milliseconds: 300), () {
          loadMoreData();
        });
      }
    });
    super.onInit();
  }

  void loadMoreData() {
    // Only load if there are more items to show
    if (itemsToDisplay.value < userPaymentsController.userPaymets.length) {
      itemsToDisplay.value += 10;
    }
  }
}
