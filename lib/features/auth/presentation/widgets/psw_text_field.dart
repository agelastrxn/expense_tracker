import 'package:expense_tracker/app/constants/texts.dart';
import 'package:flutter/material.dart';

class PswTextField extends StatelessWidget {
    final Function(String) onChanged;

  const PswTextField({super.key, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      obscureText: true,
      obscuringCharacter: '†',
      decoration: InputDecoration(
        hintText: AppTexts.password,
      ),
    );
  }
}
