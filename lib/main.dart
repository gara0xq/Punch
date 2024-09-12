import 'package:easy_localization/easy_localization.dart';
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

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(
     EasyLocalization(
      supportedLocales: [Locale('en'), Locale('ar')],
      path: 'assets/translations',
      startLocale: Locale('ar'), //App Starts with Arabic
      child: MyApp()
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  //eeeeeeaaaa
  @override
  Widget build(BuildContext context) {
    entryController.loadPreferences();
    return GetMaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      debugShowCheckedModeBanner: false,
      initialBinding: Binding(),
      initialRoute: "/",
      getPages: [
        GetPage(name: '/', page: () => const SplashScreen()),
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
