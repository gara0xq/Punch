import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:punch/Models/Login_Model.dart';
import 'package:http/http.dart' as http;
import 'package:punch/screens/home_screen.dart';

class LoginController {
  final BuildContext context;
  LoginController({required this.context});
  Future<void> login(Loginmodel Loginmodel) async {
    const String apiUrl =
        'https://ptechapp-5ab6d15ba23c.herokuapp.com/user/authenticate';

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {'Content-Type': 'application/json; charset=UTF-8'},
        body: jsonEncode(Loginmodel.tojson()),
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
