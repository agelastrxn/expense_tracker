import 'package:expense_tracker/features/auth/domain/entities/user_entity.dart';
import 'package:expense_tracker/features/auth/presentation/pages/sign_in_screen.dart';
import 'package:expense_tracker/features/auth/presentation/pages/sign_up_screen.dart';
import 'package:expense_tracker/features/home/domain/entities/expense_entity.dart';
import 'package:expense_tracker/features/home/presentation/pages/home_screen.dart';
import 'package:expense_tracker/features/home/presentation/pages/navbar_screen.dart';
import 'package:expense_tracker/features/profile/presentation/pages/profile_screen.dart';
import 'package:expense_tracker/features/welcome/screens/welcome_screen.dart';
import 'package:flutter/material.dart';

class Routes {
  static const String welcome = '/';
  static const String singIn = '/singIn';
  static const String signUp = '/signUp';
  static const String navBar = '/navBar';
  static const String home = '/home';
  static const String profile = '/profile';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case welcome:
        return MaterialPageRoute(builder: (_) => WelcomeScreen());
      case singIn:
        return MaterialPageRoute(builder: (_) => SignInScreen());
      case signUp:
        return MaterialPageRoute(builder: (_) => SignUpScreen());
      case navBar:
        final user = settings.arguments as UserEntity;
        return MaterialPageRoute(builder: (_) => NavBarScreen(user: user));
      case home:
        final user = settings.arguments as UserEntity;
        return MaterialPageRoute(builder: (_) => HomeScreen(user: user));
      case profile:
        final user = settings.arguments as UserEntity;
        final expenses = settings.arguments as List<ExpenseEntity>;
        return MaterialPageRoute(builder: (_) => ProfileScreen(user: user, expenses: expenses,));
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
