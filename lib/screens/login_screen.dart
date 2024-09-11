
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:punch/controller/auth_controller.dart';
import 'package:punch/controller/prefs_controller.dart';
import 'package:punch/model/request/login_req_model.dart';
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

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  AuthController authController = Get.put(AuthController());
  PrefsController prefsController = Get.find<PrefsController>();
  bool status = false;
  String? userId;

  @override
  Widget build(BuildContext context) {
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
                  controller: usernameController,
                  formKey: usernamestate,
                  validator: (value) =>
                      authController.usernameValidation(value!),
                  labelText: "Username",
                ),
                const SizedBox(height: 5),
                InputFormField(
                  controller: passwordController,
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
                  onPressed: () async {
                    if (usernamestate.currentState!.validate() &&
                        passwordstate.currentState!.validate()) {
                      await authController.loginController(
                        LoginReqModel(
                          username: usernameController.text,
                          password: passwordController.text,
                        ),
                      );
                      userId = authController.loginResponse.data.userAccountId;
                      prefsController.setUser(userId!);
                      Get.offAllNamed('/home');
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
