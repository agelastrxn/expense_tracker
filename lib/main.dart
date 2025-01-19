import 'package:expense_tracker/app/constants/texts.dart';
import 'package:expense_tracker/app/constants/theme.dart';
import 'package:expense_tracker/core/routes.dart';
import 'package:expense_tracker/features/auth/presentation/provider/sign_in_provider.dart';
import 'package:expense_tracker/features/auth/presentation/provider/sign_up_provider.dart';
import 'package:expense_tracker/features/home/presentation/provider/add_expense_provider.dart';
import 'package:expense_tracker/features/welcome/screens/welcome_screen.dart';
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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SignInProvider()),
        ChangeNotifierProvider(create: (_) => SignUpProvider()),
        ChangeNotifierProvider(create: (_) => AddExpenseProvider()),
      ],
      child: MaterialApp(
        title: AppTexts.appName,
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lighTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: ThemeMode.system,
        initialRoute: Routes.home,
        onGenerateRoute: Routes.generateRoute,
        home: WelcomeScreen(),
      ),
    );
  }
}
