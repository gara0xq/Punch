import 'package:flutter/material.dart';
import 'package:punch/controller/auth_controller.dart';
import 'package:punch/main.dart';
import 'package:punch/widgets/custom_auth_background.dart';
import 'package:punch/widgets/custom_button.dart';
import 'package:punch/widgets/custom_text.dart';
import 'package:punch/widgets/input_form_field.dart';

// ignore: must_be_immutable
class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});

  GlobalKey<FormState> namestate = GlobalKey();
  GlobalKey<FormState> phonestate = GlobalKey();
  GlobalKey<FormState> emailstate = GlobalKey();
  GlobalKey<FormState> passwordstate = GlobalKey();

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
                  formKey: namestate,
                  validator: (value) =>
                      authController.isEmptyValidation(value!),
                  labelText: "Full Name",
                ),
                const SizedBox(height: 17),
                InputFormField(
                  formKey: phonestate,
                  validator: (value) =>
                      authController.isEmptyValidation(value!),
                  labelText: "Phone Number",
                ),
                const SizedBox(height: 17),
                InputFormField(
                  formKey: emailstate,
                  validator: (value) => authController.emailValidation(value!),
                  labelText: "Email",
                ),
                const SizedBox(height: 17),
                InputFormField(
                  formKey: passwordstate,
                  validator: (value) =>
                      authController.passwordValidation(value!),
                  labelText: "Password",
                ),
                const SizedBox(height: 40),

                //custom button
                CustomButton(
                  text: "CREATE ACCOUNT",
                  onPressed: () {
                    if (namestate.currentState!.validate() &&
                        phonestate.currentState!.validate() &&
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
    );
  }
}
