import 'package:flutter/material.dart';
import 'package:get/get.dart';

//Change Language Method

class LocaleController extends GetxController {
  void changeLang(String langCode) {
    Locale locale = Locale(langCode);
    Get.updateLocale(locale);
  }
}
