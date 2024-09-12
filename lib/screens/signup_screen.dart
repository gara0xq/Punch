import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart' hide Trans;
import 'package:punch/controller/auth_controller.dart';
import 'package:punch/controller/prefs_controller.dart';
import 'package:punch/main.dart';
import 'package:punch/model/request/signup_req_model.dart';
import 'package:punch/widgets/custom_auth_background.dart';
import 'package:punch/widgets/custom_button.dart';
import 'package:punch/widgets/custom_text.dart';
import 'package:punch/widgets/input_form_field.dart';
import 'package:easy_localization/easy_localization.dart';

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

  AuthController authController = Get.put(AuthController());
  PrefsController prefsController = Get.find<PrefsController>();

  String? userId;

  @override
  Widget build(BuildContext context) {
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
                        text: 'sign_up'.tr(),
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
                    labelText: "first_name".tr(),
                  ),
                  const SizedBox(height: 17),
                  InputFormField(
                    controller: lastnameController,
                    formKey: lastnamestate,
                    validator: (value) =>
                        authController.isEmptyValidation(value!),
                    labelText: "last_name".tr(),
                  ),
                  const SizedBox(height: 17),
                  InputFormField(
                    controller: usernameController,
                    formKey: usernamestate,
                    validator: (value) =>
                        authController.usernameValidation(value!),
                    labelText: "username".tr(),
                  ),
                  const SizedBox(height: 17),
                  InputFormField(
                    controller: emailController,
                    formKey: emailstate,
                    validator: (value) =>
                        authController.emailValidation(value!),
                    labelText: "email".tr(),
                  ),
                  const SizedBox(height: 17),
                  InputFormField(
                    controller: passwordController,
                    formKey: passwordstate,
                    validator: (value) =>
                        authController.passwordValidation(value!),
                    labelText: "password".tr(),
                  ),
                  const SizedBox(height: 20),

                  //custom button
                  CustomButton(
                    text: "create_account".tr(),
                    onPressed: () async {
                      if (usernamestate.currentState!.validate() &&
                          emailstate.currentState!.validate() &&
                          passwordstate.currentState!.validate()) {
                        await authController.signupController(
                          SignupReqModel(
                            username: usernameController.text,
                            password: passwordController.text,
                            firstname: firstnameController.text,
                            lastname: lastnameController.text,
                            email: emailController.text,
                            language: "en",
                          ),
                        );
                        userId =
                            authController.signupResponse.data.userAccountId;
                        entryController.setUser(userId!);
                        Get.offAllNamed('/home');
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
