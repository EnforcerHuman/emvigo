import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    required this.controller,
    required this.labelText,
    this.isObscure = false,
  });

  final TextEditingController controller;
  final String labelText;
  final bool isObscure;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        filled: true,
        fillColor: Color(0xFFF7F7F7),
        labelText: labelText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          borderSide: BorderSide.none,
        ),
      ),
      obscureText: isObscure,
    );
  }
}
