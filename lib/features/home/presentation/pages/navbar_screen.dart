import 'package:expense_tracker/features/auth/domain/entities/user_entity.dart';
import 'package:expense_tracker/features/home/presentation/pages/home_screen.dart';
import 'package:expense_tracker/features/home/presentation/provider/navigation_bar_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:provider/provider.dart';

class NavBarScreen extends StatelessWidget {
  final UserEntity user;
  const NavBarScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    List tabPages = [
      HomeScreen(user: user),
      Center(child: Text("Statistics")),
      Center(child: Text("Profile")),
    ];
    final navBarProvider = Provider.of<NavigationBarProvider>(context);
    return Scaffold(
      bottomNavigationBar: GNav(
        selectedIndex: navBarProvider.selectedIndex,
        onTabChange: navBarProvider.onTabChange,
        tabs: navBarProvider.tabList,
      ),
      body: tabPages.elementAt(navBarProvider.selectedIndex),
    );
  }
}
