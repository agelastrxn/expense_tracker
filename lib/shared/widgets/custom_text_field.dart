import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String text;
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final Function(String)? onChanged;
  const CustomTextField({
    super.key,
    required this.text,
    required this.controller,
    this.keyboardType,
    this.onChanged,
    
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: keyboardType,
      controller: controller,
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: text,
      ),
    );
  }
}
