import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:punch/controller/prefs_controller.dart';
import 'package:punch/model/response/get_users_model.dart';
import 'package:http/http.dart' as http;
import 'package:punch/utils/api.dart';

class HomeController extends GetxController {
  ValueNotifier<bool> _loading = ValueNotifier(false);
  ValueNotifier<bool> get loading => _loading;

  PrefsController prefsController = Get.find<PrefsController>();

  List<GetUsersModel> _usersData = [];
  late GetUsersModel CurrentUserModel;
  late GetUsersModel userModel;
  @override
  void onInit() async {
    await fetchCurrentUserData();
    update();
    super.onInit();
  }

  Future<List<GetUsersModel>> fetchCurrentUserData() async {
    _loading.value = false;
    final response = await http.get(Uri.parse(getUsersUrl));

    var data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      for (Map<String, dynamic> index in data) {
        _usersData.add(GetUsersModel.fromJson(index));
        if (index["userAccountID"] == prefsController.getUser()) {
          CurrentUserModel = GetUsersModel.fromJson(index);
        }
      }
      update();
      _loading.value = true;

      return _usersData;
    }
    return _usersData;
  }

  GetUsersModel fetchUserData(String userId) {
    for (GetUsersModel index in _usersData) {
      if (index.userAccountId == userId) {
        userModel = index;
      }
    }

    return userModel;
  }
}
