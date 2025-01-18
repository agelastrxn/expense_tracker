import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String text;
  final Function(String) onChanged;
  const CustomTextField({super.key, required this.text, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(hintText: text),
      onChanged: onChanged,
    );
  }
}
