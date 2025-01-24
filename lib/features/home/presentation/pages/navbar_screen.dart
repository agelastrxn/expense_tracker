import 'package:expense_tracker/features/auth/domain/entities/user_entity.dart';
import 'package:expense_tracker/features/home/presentation/pages/home_screen.dart';
import 'package:expense_tracker/features/home/presentation/provider/expense_provider.dart';
import 'package:expense_tracker/features/home/presentation/provider/navigation_bar_provider.dart';
import 'package:expense_tracker/features/home/presentation/widgets/google_navbar.dart';
import 'package:expense_tracker/features/profile/presentation/pages/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NavBarScreen extends StatelessWidget {
  final UserEntity user;
  const NavBarScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    final navBarProvider = Provider.of<NavigationBarProvider>(context);
    final expenseProvider = Provider.of<ExpenseProvider>(context);
    List tabPages = [
      HomeScreen(user: user),
      Center(child: Text("Statistics")),
      ProfileScreen(user: user, expenses: expenseProvider.expenses),
    ];
    return Scaffold(
      bottomNavigationBar: GoogleNavBar(),
      body: tabPages.elementAt(navBarProvider.selectedIndex),
    );
  }
}
