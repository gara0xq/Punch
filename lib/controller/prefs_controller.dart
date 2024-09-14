import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrefsController extends GetxController {
  late SharedPreferences prefs;

  @override
  void onInit() {
    loadPreferences();
    super.onInit();
  }

  loadPreferences() async {
    prefs = await SharedPreferences.getInstance();
  }

  setUser(String userId) {
    prefs.setString("user_id", userId);
  }

  String? getUser() {
    final user = prefs.getString("user_id");
    return user;
  }

  deleteUser() {
    prefs.remove("user_id");
  }
}
