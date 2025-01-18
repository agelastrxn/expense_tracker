import 'package:expense_tracker/app/constants/texts.dart';
import 'package:expense_tracker/app/constants/theme.dart';
import 'package:expense_tracker/features/sing_in/presentation/provider/sing_in_provider.dart';
import 'package:expense_tracker/features/sing_in/presentation/screens/sign_in_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
   WidgetsFlutterBinding.ensureInitialized();
   await Firebase.initializeApp();
   runApp(ExpenseTracker());
}

class ExpenseTracker extends StatelessWidget {
  const ExpenseTracker({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SingInProvider(),
      child: MaterialApp(
        title: AppTexts.appName,
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lighTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: ThemeMode.system,
        home: SignInScreen(),
      ),
    );
  }
}
