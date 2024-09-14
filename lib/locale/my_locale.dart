import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

import 'package:get/get.dart';

class MyLocale implements Translations {
  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys => {
        "gr": arTranslation,
        "en": enTranslation,
      };
  static late Map<String, String> arTranslation;
  static late Map<String, String> enTranslation;

  static Future<void> loadTranslations() async {
    final arJson = await rootBundle.loadString("assets/translations/ar.json");
    final enJson = await rootBundle.loadString("assets/translations/en.json");

    arTranslation = Map<String, String>.from(json.decode(arJson));
    enTranslation = Map<String, String>.from(json.decode(enJson));
  }
}
