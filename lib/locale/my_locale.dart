import 'dart:convert';
import 'dart:developer';
import 'package:flutter/services.dart' show rootBundle;

import 'package:get/get.dart';

class MyLocale implements Translations {
  static Map<String, String> arTranslation = {};
  static Map<String, String> enTranslation = {};
  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys => {
        "ar": arTranslation,
        "en": enTranslation,
      };

  static Future<void> loadTranslations() async {
    final arJson = await rootBundle.loadString("assets/translations/ar.json");
    final enJson = await rootBundle.loadString("assets/translations/en.json");

    arTranslation = Map<String, String>.from(json.decode(arJson));
    enTranslation = Map<String, String>.from(json.decode(enJson));
  }
}
