import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:punch/Models/Signup_Model.dart';
import 'package:http/http.dart' as http;
import 'package:punch/screens/home_screen.dart';

class SignupController {
  final BuildContext context;
  SignupController({required this.context});
  Future<void> signup(SignupModel SignupModel) async {
    const String apiUrl =
        'https://ptechapp-5ab6d15ba23c.herokuapp.com/user/register';

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {'Content-Type': 'application/json; charset=UTF-8'},
        body: jsonEncode(SignupModel.tojson()),
      );

      log('Response Status: ${response.statusCode}');
      log('Response Body: ${response.body}');

      if (response.statusCode == 200 &&
          response.body != '''{"success":false}''') {
        // Optionally save token to secure storage here
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => HomeScreen()));
      } else {
        final errorData = jsonDecode(response.body);
        final errorMessage =
            errorData['message'] ?? 'Username or Password wrong';
        _showSnackBar('Login Failed: $errorMessage');
      }
    } catch (e) {
      _showSnackBar('Error: $e');
    }
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }
}
