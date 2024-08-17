import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomTextField extends StatelessWidget {
  final TextEditingController textEditingController;
  final String labelText, hintText;
  final bool obscureText;
  const CustomTextField(
      {required this.labelText,
      required this.hintText,
      required this.obscureText,
      required this.textEditingController,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: TextField(
        controller: textEditingController,
        obscureText: obscureText,
        decoration: InputDecoration(
            border: const OutlineInputBorder(),
            labelText: labelText,
            hintText: hintText),
      ),
    );
  }
}
