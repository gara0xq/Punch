import 'package:flutter/material.dart';
import 'package:punch/screens/home_screen.dart';
import 'package:punch/screens/login_screen.dart';
import 'package:punch/screens/signup_screen.dart';
import 'package:punch/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: {
        '/': (context) => const SplashScreen(),
        '/welcome': (context) => const SplashScreen(),
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
