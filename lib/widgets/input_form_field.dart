import 'package:flutter/material.dart';

// ignore: must_be_immutable
class InputFormField extends StatelessWidget {
  String? Function(String?)? validator;
  GlobalKey formKey;
  String labelText;
  TextEditingController controller;
  InputFormField({
    super.key,
    required this.formKey,
    required this.validator,
    required this.labelText,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: TextFormField(
        controller: controller,
        validator: validator,
        decoration: InputDecoration(
          prefix: const SizedBox(width: 10),
          labelText: labelText,
          labelStyle: const TextStyle(
            color: Colors.grey,
            fontWeight: FontWeight.w600,
            fontFamily: "Raleway",
            fontSize: 13,
          ),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(60)),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(60),
            borderSide: const BorderSide(color: Colors.black, width: 1.8),
          ),
        ),
      ),
    );
  }
}
