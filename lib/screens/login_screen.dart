import 'package:flutter/material.dart';
import 'package:punch/controller/auth_controller.dart';
import 'package:punch/main.dart';
import 'package:punch/screens/home_screen.dart';
import 'package:punch/widgets/custom_auth_background.dart';
import 'package:punch/widgets/custom_button.dart';
import 'package:punch/widgets/custom_text.dart';
import 'package:punch/widgets/input_form_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GlobalKey<FormState> usernamestate = GlobalKey();
  GlobalKey<FormState> passwordstate = GlobalKey();
  bool status = false;
  String? userId;

  @override
  Widget build(BuildContext context) {
    //instance from controller
    AuthController authController = AuthController();

    return Scaffold(
      backgroundColor: const Color(0xFF1F1F24),
      body: CustomAuthBackground(
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            padding:
                const EdgeInsets.only(right: 20, left: 20, top: 40, bottom: 40),
            width: double.infinity,
            height: 520,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50), topRight: Radius.circular(50)),
              color: Color(0xffFFFFFF),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: [
                    userId != null
                        ? const BackButton()
                        : const SizedBox(width: 60),
                    const SizedBox(width: 95),
                    CustomText(
                      text: "Login",
                      fontSize: 24,
                      color: Colors.black,
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                InputFormField(
                  formKey: usernamestate,
                  validator: (value) => authController.emailValidation(value!),
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
                          color: Colors.black,
                        ),
                      ],
                    ),
                    CustomText(
                      text: "Forgot Password?",
                      color: const Color(0xff1C7997),
                    ),
                  ],
                ),
                Row(
                  children: [
                    CustomText(
                      text: "Not a member?",
                      color: Colors.black,
                    ),
                    const SizedBox(width: 5),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          "/register",
                        );
                      },
                      child: CustomText(
                        text: "Create an account",
                        color: const Color(0xffA31CFF),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomButton(
                  text: "Login",
                  onPressed: () {
                    if (usernamestate.currentState!.validate() &&
                        passwordstate.currentState!.validate()) {
                      // change 00000 to userId from API
                      entryController.setUser("00000");
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
    );
  }
}
