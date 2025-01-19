import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final String text;
  final Function(String)? onChanged;
  const CustomTextField({
    super.key,
    required this.text,
    this.keyboardType,
    this.onChanged,
    this.controller,
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
