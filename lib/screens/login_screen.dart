import 'package:flutter/material.dart';
import 'package:punch/controller/auth_controller.dart';
import 'package:punch/screens/home_screen.dart';
import 'package:punch/widgets/custom_auth_background.dart';
import 'package:punch/widgets/custom_button.dart';
import 'package:punch/widgets/custom_text.dart';
import 'package:punch/widgets/input_form_field.dart';

bool status = false;

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GlobalKey<FormState> emailstate = GlobalKey();
  GlobalKey<FormState> passwordstate = GlobalKey();

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
    //instance from controller
    AuthController authController = AuthController();

    return Scaffold(
      body: CustomAuthBackground(
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            width: double.infinity,
            height: 520,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50), topRight: Radius.circular(50)),
              color: Color(0xffFFFFFF),
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 35),
              child: Column(
                children: [
                  CustomText(
                    text: "Login",
                    fontSize: 28,
                  ),
                  const SizedBox(height: 30),
                  InputFormField(
                    formKey: emailstate,
                    validator: (value) =>
                        authController.emailValidation(value!),
                    labelText: "Email",
                  ),
                  const SizedBox(height: 5),
                  InputFormField(
                    formKey: passwordstate,
                    validator: (value) =>
                        authController.passwordValidation(value!),
                    labelText: "Password",
                  ),
                  Row(
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
                          CustomText(
                            text: "Remember Me",
                          ),
                        ],
                      ),
                      CustomText(
                        text: "Forgot Password?",
                        color: Color(0xff1C7997),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      CustomText(
                        text: "Not a member?",
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            "/register",
                          );
                        },
                        child: CustomText(
                          text: "Create an account",
                          color: Color(0xffA31CFF),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 35,
                  ),
                  CustomButton(
                    text: "Login",
                    onPressed: () {
                      if (emailstate.currentState!.validate() &&
                          passwordstate.currentState!.validate()) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HomeScreen(),
                          ),
                        );
                      }
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
