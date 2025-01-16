import 'package:expense_tracker/app/constants/texts.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(AppTexts.signIn),
            SizedBox(height: 10),
            TextField(),
            SizedBox(height: 10),
            TextField(),
            SizedBox(height: 10),
            FilledButton(
              onPressed: () {},
              child: Text(AppTexts.signIn),
            ),
          ],
        ),
      ),
    );
  }
}
