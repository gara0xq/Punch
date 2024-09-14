import 'package:flutter/material.dart';
import 'package:flutter_toggle_tab/flutter_toggle_tab.dart';
import 'package:punch/controller/lang_button_controller.dart';
import 'package:punch/utils/colors.dart';
import 'package:punch/locale/local_controller.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class LangButton extends StatelessWidget {
  List<String> langList = ["EN".tr, "AR".tr];
  int _tabSelectedIndexSelected = 0;
  LocaleController localController = Get.put(LocaleController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LangButtonController>(
        init: LangButtonController(),
        builder: (controller) {
          return FlutterToggleTab(
            width: 30,
            height: 40,
            borderRadius: 15,
            selectedIndex: _tabSelectedIndexSelected,
            selectedTextStyle: TextStyle(
                color: Colors.white, fontSize: 14, fontWeight: FontWeight.w600),
            selectedBackgroundColors: [
              blue,
              const Color.fromARGB(255, 52, 4, 134)
            ],
            unSelectedBackgroundColors: [Colors.grey.shade900],
            unSelectedTextStyle: TextStyle(
                color: Colors.white, fontSize: 14, fontWeight: FontWeight.w600),
            labels: langList,
            selectedLabelIndex: (index) => controller.changeLang(index),
          );
        });
  }
}
