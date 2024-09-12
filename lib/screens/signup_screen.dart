import 'package:flutter/material.dart';
import 'package:punch/screens/home_screen.dart';

// ignore: must_be_immutable
class SignupScreen extends StatelessWidget {
  GlobalKey<FormState> namestate = GlobalKey();
  GlobalKey<FormState> phonestate = GlobalKey();
  GlobalKey<FormState> emailstate = GlobalKey();
  GlobalKey<FormState> passwordstate = GlobalKey();

  SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFF1F1F24),
        body: Stack(children: [
          // First Circle
          const Positioned(
              top: -40,
              left: -50,
              child: CircleAvatar(
                radius: 85,
                backgroundColor: Color(0xFF810E4E),
              )),
          const Positioned(
              // Second Circle
              top: 85,
              right: -50,
              child: CircleAvatar(
                radius: 95,
                backgroundColor: Color(0xFF1C7997),
              )),
          const Positioned(
            top: 85,
            right: 20,
            left: 15,
            child: Text(
              "PUNCH",
              style: TextStyle(
                  fontFamily: "Raleway",
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 43),
              textAlign: TextAlign.center,
            ),
          ),
          const Positioned(
            top: 140,
            right: 20,
            left: 15,
            child: Text(
              "Punch - Earn - Repeat",
              style: TextStyle(
                  fontFamily: "Raleway",
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 12),
              textAlign: TextAlign.center,
            ),
          ),
          Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: const EdgeInsets.all(20),
                height: 600,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40)),
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    const Center(
                      child: Text(
                        "Sign up",
                        style: TextStyle(
                            color: Color(0xFF2B2B2B),
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Raleway"),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: 50),
                    Form(
                        key: namestate,
                        child: Column(children: [
                          TextFormField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Empty Field";
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                                prefix: const SizedBox(width: 10),
                                labelText: "  Full Name",
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
                          const SizedBox(height: 17),
                          Form(
                            key: phonestate,
                            child: TextFormField(
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Empty Field";
                                } else if (value.length < 11 ||
                                    value.length > 11) {
                                  return "Incorrect Phone Number";
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                  prefix: const SizedBox(width: 10),
                                  labelText: "  Phone Number",
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
                          const SizedBox(height: 17),
                          Form(
                            key: emailstate,
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
                          const SizedBox(height: 17),
                          Form(
                            key: passwordstate,
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
                          const SizedBox(height: 40),
                          MaterialButton(
                              onPressed: () {
                                if (namestate.currentState!.validate() &&
                                    phonestate.currentState!.validate() &&
                                    emailstate.currentState!.validate() &&
                                    passwordstate.currentState!.validate()) {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => HomeScreen()));
                                }
                              },
                              minWidth: double.infinity,
                              color: Colors.black,
                              height: 60,
                              textColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50)),
                              child: const Text(
                                "CREATE ACCOUNT",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontFamily: "Raleway",
                                    fontWeight: FontWeight.w700),
                              ))
                        ]))
                  ],
                ),
              ))
        ]));
  }
}
