import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:punch/controller/prefs_controller.dart';
import 'package:punch/model/response/user_payment_model.dart';
import 'dart:convert';

import 'package:punch/utils/api.dart';

class UserPaymentsController extends GetxController {
  PrefsController _prefsController = Get.find<PrefsController>();

  ValueNotifier<bool> _loading = ValueNotifier(false);
  ValueNotifier<bool> get loading => _loading;
  String? accountNum;
  @override
  void onInit() {
    accountNum = _prefsController.getUser().toString();
    fetchUserPayment();
    super.onInit();
  }

  List<UserPaymentModel> userPaymets = [];

  Future<List<UserPaymentModel>> fetchUserPayment() async {
    _loading.value = false;
    final response = await http.get(Uri.parse(userPaymenyUrl + accountNum!));

    if (response.statusCode == 200) {
      update();
      _loading.value = true;
      var data = jsonDecode(response.body);
      for (Map<String, dynamic> index in data) {
        userPaymets.add(UserPaymentModel.fromJson(index));
      }
      return userPaymets;
    }
    return userPaymets;
  }
}
