import 'package:expense_tracker/app/constants/texts.dart';
import 'package:expense_tracker/app/constants/theme.dart';
import 'package:expense_tracker/core/get_it.dart';
import 'package:expense_tracker/core/routes.dart';
import 'package:expense_tracker/features/auth/presentation/provider/auth_provider.dart';
import 'package:expense_tracker/features/home/presentation/provider/expense_provider.dart';
import 'package:expense_tracker/features/home/presentation/provider/navigation_bar_provider.dart';
import 'package:expense_tracker/features/profile/presentation/provider/profile_provider.dart';
import 'package:expense_tracker/features/welcome/screens/welcome_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await Injection.setUp();
  runApp(ExpenseTracker());
}

class ExpenseTracker extends StatelessWidget {
  const ExpenseTracker({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => ExpenseProvider()),
        ChangeNotifierProvider(create: (_) => NavigationBarProvider()),
        ChangeNotifierProvider(create: (_) => ProfileProvider()),
      ],
      child: Builder(
        builder: (context) {
          final profileProvider = Provider.of<ProfileProvider>(context);
          return MaterialApp(
            title: AppTexts.appName,
            debugShowCheckedModeBanner: false,
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: profileProvider.themeToggle ? ThemeMode.light : ThemeMode.dark,
            initialRoute: Routes.welcome,
            onGenerateRoute: Routes.generateRoute,
            home: WelcomeScreen(),
          );
        },
      ),
    );
  }
}
