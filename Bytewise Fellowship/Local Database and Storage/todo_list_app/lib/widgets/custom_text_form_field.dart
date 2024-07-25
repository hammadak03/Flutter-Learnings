import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  int? maxLines;
  int? minLines;
  CustomTextFormField(
      {this.maxLines,
      this.minLines,
      required this.controller,
      required this.hintText,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: TextFormField(
        keyboardType: TextInputType.multiline,
        maxLines: maxLines,
        minLines: minLines,
        controller: controller,
        decoration:
            InputDecoration(border: OutlineInputBorder(), hintText: hintText),
        validator: (value) {
          if (value!.isEmpty) return 'Enter some text';
          return null;
        },
      ),
    );
  }
}
