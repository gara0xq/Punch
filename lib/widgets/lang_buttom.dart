import 'package:flutter/material.dart';
import 'package:flutter_toggle_tab/flutter_toggle_tab.dart';
import 'package:punch/utils/colors.dart';
import 'package:punch/locale/local_controller.dart';
import 'package:get/get.dart';

class LangButton extends StatefulWidget {
  const LangButton({super.key});

  @override
  State<LangButton> createState() => langButton();
}

class langButton extends State<LangButton> {
  int _tabSelectedIndexSelected = 0;
  LocaleController localController = Get.put(LocaleController());

  @override
  Widget build(BuildContext context) {
    return FlutterToggleTab(
      width: 30,
      height: 40,
      borderRadius: 15,
      selectedIndex: _tabSelectedIndexSelected,
      selectedTextStyle: TextStyle(
          color: Colors.white, fontSize: 14, fontWeight: FontWeight.w600),
      selectedBackgroundColors: [blue, const Color.fromARGB(255, 52, 4, 134)],
      unSelectedBackgroundColors: [Colors.grey.shade900],
      unSelectedTextStyle: TextStyle(
          color: Colors.white, fontSize: 14, fontWeight: FontWeight.w600),
      labels: ["EN", "AR"],
      selectedLabelIndex: (index) {
        setState(() {
          _tabSelectedIndexSelected = index;

          if (_tabSelectedIndexSelected == 0) {
            localController.changeLang("en");
          } else if (_tabSelectedIndexSelected == 1) {
            localController.changeLang("ar");
          }
        });
      },
    );
  }
}
