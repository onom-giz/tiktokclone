import 'package:flutter/material.dart';
import 'package:tictok_clone2/constants.dart';

class TextInputField extends StatelessWidget {
  final TextEditingController controller;
  final String lebelText;
  final bool isObscure;
  final IconData icon;

  const TextInputField(
      {super.key,
      required this.controller,
      required this.icon,
      this.isObscure = false,
      required this.lebelText});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
          labelText: lebelText,
          prefixIcon: Icon(icon),
          labelStyle: const TextStyle(fontSize: 20),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide:
                  const BorderSide(color: borderColor)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide:
                  const BorderSide(color: borderColor))),
      obscureText: isObscure,
    );
  }
}
