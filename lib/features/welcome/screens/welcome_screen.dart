
import 'package:expense_tracker/app/constants/texts.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(Icons.account_balance_wallet, size: 100),
            SizedBox(height: 100),
            Text(AppTexts.welcomeMessage),
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
