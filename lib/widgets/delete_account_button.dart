import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DeleteAccountButton extends StatelessWidget {
  const DeleteAccountButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.red,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      icon: Icon(
        Icons.delete,
        color: Colors.white,
        size: 24,
      ),
      label: const Text(
        'Delete Account',
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
