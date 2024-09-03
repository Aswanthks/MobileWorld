import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String name;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final String hintText;
  final bool obscureText;
  final IconData? prefixIcon;

  CustomTextField({
    required this.name,
    required this.controller,
    this.keyboardType = TextInputType.text,
    this.hintText = '',
    this.obscureText = false,
    this.prefixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        controller: controller,
        keyboardType: keyboardType,
        obscureText: obscureText,
        decoration: InputDecoration(
          labelText: name,
          hintText: hintText,
          prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
        ),
      ),
    );
  }
}
