import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:punch/model/request/login_req_model.dart';
import 'package:http/http.dart' as http;
import 'package:punch/model/request/signup_req_model.dart';
import 'package:punch/model/response/login_res_model.dart';
import 'package:punch/model/response/signup_res_model.dart';
import 'package:punch/utils/api.dart';

class AuthController extends GetxController {
  late LoginResModel loginResponse;
  late SignupResModel signupResponse;

  Future<bool> loginController(LoginReqModel loginModel) async {
    final response = await http.post(
      Uri.parse(loginUrl),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(loginModel.toJson()),
    );

    loginResponse = LoginResModel.fromJson(jsonDecode(response.body));
    if (response.statusCode == 200 &&
        response.body != '''{"success":false}''') {
      log("true");
      return true;
    }
    log("false");
    return false;
  }

  Future<bool> signupController(SignupReqModel signupModel) async {
    final response = await http.post(
      Uri.parse(registerUrl),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(signupModel.toJson()),
    );
    signupResponse = SignupResModel.fromJson(jsonDecode(response.body));
    if (response.statusCode == 200 &&
        response.body != '''{"success":false}''') {
      return true;
    }
    return false;
  }

  isEmptyValidation(String value) {
    if (value.isEmpty) {
      return "Field cannot be Empty";
    }
    return null;
  }

  passwordValidation(String value) {
    if (value.isEmpty) {
      return "Field cannot be Empty";
    } else if (value.length < 8) {
      return "Password Should be at least 8 characters";
    }
  }

  emailValidation(String value) {
    if (value.isEmpty) {
      return "Empty Field";
    } else if (!value.contains('@')) {
      return "Email Should Contain @ ";
    } else if (!value.contains('.com')) {
      return "Email Should Contain .com";
    }
  }

  //username validation
  usernameValidation(String value) {
    if (value.isEmpty) {
      return "Empty Field";
    }
  }

  numberValidation(String value) {
    if (value.contains(new RegExp(r'[a-z]'))) {
      return "Shouldn't contain letters";
    }
  }
}
