import 'package:flutter/material.dart';
import 'package:punch/screens/home_screen.dart';
import 'package:punch/screens/signup_screen.dart';

bool status = false;

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GlobalKey<FormState> emailstate = GlobalKey();
  GlobalKey<FormState> passwordstate = GlobalKey();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _validateAndLogin() {
    if (emailstate.currentState!.validate() &&
        passwordstate.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Processing Login')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: SizedBox(
              width: double.infinity,
              child: Image.asset(
                "assets/images/login_bg.png",
                fit: BoxFit.cover,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              height: 520,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50)),
                  color: Color(0xffFFFFFF)),
              child: Padding(
                padding: const EdgeInsets.only(top: 35),
                child: Column(
                  children: [
                    const Text(
                      "Login",
                      style: TextStyle(fontSize: 28, fontFamily: 'Raleway'),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Form(
                      key: emailstate,
                      child: SizedBox(
                        width: 340,
                        height: 80,
                        child: TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Empty Field";
                            } else if (!value.contains('@')) {
                              return "Email Should Contain @ ";
                            } else if (!value.contains('.com')) {
                              return "Email Should Contain .com";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              prefix: const SizedBox(width: 10),
                              labelText: "  Email",
                              labelStyle: const TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: "Raleway",
                                  fontSize: 13),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(60)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(60),
                                  borderSide: const BorderSide(
                                      color: Colors.black, width: 1.8))),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Form(
                      key: passwordstate,
                      child: SizedBox(
                        width: 340,
                        height: 80,
                        child: TextFormField(
                          obscureText: true,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Empty Field";
                            } else if (value.length < 8) {
                              return "Password Should be at least 8 characters";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            prefix: const SizedBox(width: 10),
                            labelText: "  Password",
                            labelStyle: const TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.w600,
                                fontFamily: "Raleway",
                                fontSize: 13),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(60)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(60),
                                borderSide: const BorderSide(
                                    color: Colors.black, width: 1.8)),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 28, right: 40),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Checkbox(
                                  value: status,
                                  onChanged: (val) {
                                    setState(() {
                                      status = val!;
                                    });
                                  }),
                              const Text(
                                "Remember Me",
                                style: TextStyle(
                                  fontFamily: 'Raleway',
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                          const Text(
                            "Forgot Password?",
                            style: TextStyle(
                              color: Color(0xff1C7997),
                              fontFamily: 'Raleway',
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 43),
                      child: Row(
                        children: [
                          Text(
                            "Not a member?",
                            style: TextStyle(
                              fontFamily: 'Raleway',
                              fontSize: 14,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SignupScreen()));
                            },
                            child: Padding(
                              padding: EdgeInsets.only(left: 5),
                              child: Text(
                                "Create an account",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: 'Raleway',
                                    color: Color(0xffA31CFF)),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 35,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 2),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {
                                if (emailstate.currentState!.validate() &&
                                    passwordstate.currentState!.validate()) {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => HomeScreen()));
                                }
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: const Color(0xff000000),
                                  borderRadius: BorderRadius.circular(60),
                                ),
                                width: 340,
                                height: 60,
                                child: const Center(
                                  child: Text(
                                    "Login",
                                    style: TextStyle(
                                        fontFamily: 'Raleway',
                                        color: Colors.white,
                                        fontSize: 20),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
