import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:punch/binding.dart';
import 'package:punch/controller/prefs_controller.dart';
import 'package:punch/screens/controller_screen.dart';
import 'package:punch/screens/history_screen.dart';
import 'package:punch/screens/home_screen.dart';
import 'package:punch/screens/login_screen.dart';
import 'package:punch/screens/signup_screen.dart';
import 'package:punch/screens/splash_screen.dart';
import 'package:punch/screens/transfer_request_screen.dart';
import 'package:punch/screens/welcome_screen.dart';

PrefsController entryController = PrefsController();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    entryController.loadPreferences();
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: Binding(),
      initialRoute: "/",
      getPages: [
        GetPage(name: '/', page: () =>  ControllerScreen ()),
        GetPage(name: '/controller', page: () => ControllerScreen()),
        GetPage(name: '/welcome', page: () => const WelcomeScreen()),
        GetPage(name: '/login', page: () => const LoginScreen()),
        GetPage(name: '/register', page: () => SignupScreen()),
        GetPage(name: '/home', page: () => HomeScreen()),
        GetPage(name: '/history', page: () => HistoryScreen()),
        GetPage(name: '/transfer_request', page: () => TransferRequestScreen()),
      ],
    );
  }
}
