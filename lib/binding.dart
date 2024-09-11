import 'package:get/get.dart';
import 'package:punch/controller/prefs_controller.dart';

class Binding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PrefsController());
  }
}
