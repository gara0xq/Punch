import 'package:flutter/material.dart';
import 'package:punch/screens/login_screen.dart';
import 'package:punch/widgets/custom_text.dart';
import 'package:punch/widgets/welcome_widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});
  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/images/welcome_bg.png',
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 630,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(60),
                  topRight: Radius.circular(60),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: 250,
                    child: PageView(
                      controller: _controller,
                      children: [
                        WelcomeWidget(
                          text:
                              'Organize, find, and enjoy your\nloyalty cards in a more modern\nand dynamic way',
                          image: 'assets/icons/Icon1.png',
                        ),
                        WelcomeWidget(
                          text:
                              'Your money, your control smart\nbank with lower fees!',
                          image: 'assets/icons/Icon2.png',
                        ),
                        WelcomeWidget(
                          text:
                              'Lock it down, bank with confidence\n Your security, our commitment.',
                          image: 'assets/icons/Icon3.png',
                        ),
                      ],
                    ),
                  ),
                  SmoothPageIndicator(
                    controller: _controller,
                    count: 3,
                    effect: const JumpingDotEffect(),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, "/register");
                    },
                    child: Container(
                      width: 240,
                      height: 55,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Center(
                        child: CustomText(
                          text: 'SIGN UP',
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginScreen(),
                        ),
                      );
                    },
                    child: Container(
                      width: 240,
                      height: 55,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 2),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Center(
                        child: CustomText(
                          text: 'LOGIN',
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
