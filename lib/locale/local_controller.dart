import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

//Change Language Method

class LocalController {
  changeLang(BuildContext context, Locale local) {
    if (EasyLocalization.of(context)!.locale == Locale("en")) {
      EasyLocalization.of(context)!.setLocale(Locale("ar"));
    }else{
      EasyLocalization.of(context)!.setLocale(Locale("en"));
    }
  }
}
