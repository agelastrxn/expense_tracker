import 'package:expense_tracker/app/constants/colors.dart';
import 'package:expense_tracker/features/home/presentation/provider/navigation_bar_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:provider/provider.dart';

class GoogleNavBar extends StatelessWidget {
  const GoogleNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final navBarProvider = Provider.of<NavigationBarProvider>(context);
    return GNav(
      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
      tabBorderRadius: 20,
      tabActiveBorder: Border.all(width: 0.5, color: AppColors.primary),
      rippleColor: AppColors.primary,
      gap: 10,
      selectedIndex: navBarProvider.selectedIndex,
      onTabChange: navBarProvider.onTabChange,
      tabs: navBarProvider.tabList,
    );
  }
}
