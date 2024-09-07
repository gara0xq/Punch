import 'package:flutter/material.dart';
import 'package:punch/main.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  String? userId;
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 3), () {
      String? user = entryController.getUser();

      user == null
          ? Navigator.pushReplacementNamed(context, "/welcome")
          : Navigator.pushReplacementNamed(context, "/login");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Center(
          child: Image.asset(
            'assets/images/Splash Screen.png',
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
