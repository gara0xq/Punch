import 'package:flutter/material.dart';
import 'package:punch/controller/entry_controller.dart';
import 'package:punch/screens/home_screen.dart';
import 'package:punch/screens/login_screen.dart';
import 'package:punch/screens/signup_screen.dart';
import 'package:punch/screens/splash_screen.dart';
import 'package:punch/screens/welcome_screen.dart';

EntryController entryController = EntryController();
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    entryController.loadPreferences();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: {
        '/': (context) => const SplashScreen(),
        '/welcome': (context) => WelcomeScreen(),
        '/login': (context) => const LoginScreen(),
        '/register': (context) => SignupScreen(),
        '/home': (context) => const HomeScreen(),
        '/trasactions_history': (context) => const SplashScreen(),
        '/transfer': (context) => const SplashScreen(),
        '/transfer_completed': (context) => const SplashScreen(),
      },
    );
  }
}
