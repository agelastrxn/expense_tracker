import 'package:expense_tracker/features/auth/presentation/pages/sign_in_screen.dart';
import 'package:expense_tracker/features/auth/presentation/pages/sign_up_screen.dart';
import 'package:expense_tracker/features/home/presentation/pages/home_screen.dart';
import 'package:expense_tracker/features/welcome/screens/welcome_screen.dart';
import 'package:flutter/material.dart';

class Routes {
  static const String welcome = '/';
  static const String singIn = '/singIn';
  static const String signUp = '/signUp';
  static const String home = '/home';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case welcome:
        return MaterialPageRoute(builder: (_) => WelcomeScreen());
      case singIn:
        return MaterialPageRoute(builder: (_) => SignInScreen());
      case signUp:
        return MaterialPageRoute(builder: (_) => SignUpScreen());
      case home:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text('No route defined for ${settings.name}'),
                  ),
                ));
    }
  }
}
