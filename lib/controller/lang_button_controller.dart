import 'package:get/get.dart';
import 'package:punch/locale/local_controller.dart';

class LangButtonController extends GetxController {
  LocaleController localController = Get.put(LocaleController());
  List<String> langList = ["EN", "AR"];
  int tabSelectedIndexSelected = 0;

  changeLang(int index) {
    tabSelectedIndexSelected = index;

    if (tabSelectedIndexSelected == 0) {
      localController.changeLang("en");
    } else if (tabSelectedIndexSelected == 1) {
      localController.changeLang("ar");
    }
    update();
  }
}
