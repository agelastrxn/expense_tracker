import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class NavigationBarProvider extends ChangeNotifier {
  int selectedIndex = 0;
  List<GButton> tabList = [
    GButton(
      icon: Icons.home,
      text: 'Home',
    ),
    GButton(
      icon: Icons.stacked_line_chart_sharp,
      text: 'Statistics',
    ),
    GButton(
      icon: Icons.person,
      text: 'Profile',
    ),
  ];

  void onTabChange(int index) {
    selectedIndex = index;
    notifyListeners();
  }
}
