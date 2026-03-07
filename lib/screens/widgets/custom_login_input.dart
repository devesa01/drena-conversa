import 'package:flutter/material.dart';

class CustomLoginInput extends StatelessWidget {
  final String label;
  final bool obscureText;
  final TextEditingController? controller;

  const CustomLoginInput({
    super.key,
    required this.label,
    this.obscureText = false,
    this.controller,
  });
  
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: Colors.white70),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white54),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
      ),
    );
  }
}