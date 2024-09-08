import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:punch/controller/auth_controller.dart';
import 'package:punch/main.dart';
import 'package:punch/widgets/custom_auth_background.dart';
import 'package:punch/widgets/custom_button.dart';
import 'package:punch/widgets/custom_text.dart';
import 'package:punch/widgets/input_form_field.dart';

// ignore: must_be_immutable
class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});

  GlobalKey<FormState> firstnamestate = GlobalKey();
  GlobalKey<FormState> lastnamestate = GlobalKey();
  GlobalKey<FormState> usernamestate = GlobalKey();
  GlobalKey<FormState> emailstate = GlobalKey();
  GlobalKey<FormState> passwordstate = GlobalKey();

  TextEditingController firstnameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    //instance from controller
    AuthController authController = AuthController();

    return Scaffold(
      backgroundColor: const Color(0xFF1F1F24),

      //custom bg
      body: CustomAuthBackground(
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            padding: const EdgeInsets.all(20),
            height: 600,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40), topRight: Radius.circular(40)),
              color: Colors.white,
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      const BackButton(),
                      const SizedBox(width: 95),
                      CustomText(
                        text: "Sign up",
                        fontSize: 24,
                        color: Colors.black,
                      ),
                    ],
                  ),
                  const SizedBox(height: 50),

                  //form
                  InputFormField(
                    controller: firstnameController,
                    formKey: firstnamestate,
                    validator: (value) =>
                        authController.isEmptyValidation(value!),
                    labelText: "First Name",
                  ),
                  const SizedBox(height: 17),
                  InputFormField(
                    controller: lastnameController,
                    formKey: lastnamestate,
                    validator: (value) =>
                        authController.isEmptyValidation(value!),
                    labelText: "Last Name",
                  ),
                  const SizedBox(height: 17),
                  InputFormField(
                    controller: usernameController,
                    formKey: usernamestate,
                    validator: (value) =>
                        authController.usernameValidation(value!),
                    labelText: "Username",
                  ),
                  const SizedBox(height: 17),
                  InputFormField(
                    controller: emailController,
                    formKey: emailstate,
                    validator: (value) =>
                        authController.emailValidation(value!),
                    labelText: "Email",
                  ),
                  const SizedBox(height: 17),
                  InputFormField(
                    controller: passwordController,
                    formKey: passwordstate,
                    validator: (value) =>
                        authController.passwordValidation(value!),
                    labelText: "Password",
                  ),
                  const SizedBox(height: 20),

                  //custom button
                  CustomButton(
                    text: "CREATE ACCOUNT",
                    onPressed: () {
                      log(usernameController.text);
                      if (usernamestate.currentState!.validate() &&
                          emailstate.currentState!.validate() &&
                          passwordstate.currentState!.validate()) {
                        // change 00000 to userId from API
                        entryController.setUser("00000");
                        Navigator.pushReplacementNamed(
                          context,
                          '/home',
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
