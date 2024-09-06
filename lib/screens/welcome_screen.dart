import 'package:flutter/material.dart';
import 'package:punch/screens/login_screen.dart';
import 'package:punch/widgets/custom_text.dart';
import 'package:punch/widgets/welcome_widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class WelcomeScreen extends StatefulWidget {
  WelcomeScreen({Key? key}) : super(key: key);
  @override
  _WelcomeScreenState createState() {
    return _WelcomeScreenState();
  }
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
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 360),
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
                  Container(
                    alignment: const Alignment(0, 0.3),
                    child: SmoothPageIndicator(
                      controller: _controller,
                      count: 3,
                      effect: const JumpingDotEffect(),
                    ),
                  ),
                  SizedBox(
                    width: 240,
                    height: 55,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, "/register");
                      },
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 16.0),
                        backgroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                      ),
                      child: CustomText(
                        text: 'SIGN UP',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  GestureDetector(
                    child: SizedBox(
                      width: 240,
                      height: 55,
                      child: OutlinedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginScreen()));
                        },
                        style: OutlinedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 16.0),
                          side: const BorderSide(
                              color: Colors.black,
                              width: 2.0), // Border color and width
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(30.0), // Rounded corners
                          ),
                        ),
                        child: CustomText(
                          text: "LOGIN",
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
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
