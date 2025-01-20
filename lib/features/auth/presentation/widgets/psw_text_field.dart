import 'package:expense_tracker/app/constants/texts.dart';
import 'package:flutter/material.dart';

class PswTextField extends StatelessWidget {
  final Function(String)? onChanged;
  final TextEditingController controller;

  const PswTextField({
    super.key,
    this.onChanged,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: onChanged,
      obscureText: true,
      obscuringCharacter: '†',
      decoration: InputDecoration(
        hintText: AppTexts.password,
      ),
    );
  }
}
