import 'package:expense_tracker/app/constants/texts.dart';
import 'package:expense_tracker/app/constants/theme.dart';
import 'package:expense_tracker/features/sing_in/presentation/screens/sign_in_screen.dart';
import 'package:expense_tracker/features/welcome/screens/welcome_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(ExpenseTracker());

class ExpenseTracker extends StatelessWidget {
  const ExpenseTracker({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppTexts.appName,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lighTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      home: SignInScreen(),
    );
  }
}
