import 'package:shared_preferences/shared_preferences.dart';

class EntryController {
  late SharedPreferences prefs;
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
}
