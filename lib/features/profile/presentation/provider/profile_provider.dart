// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfileProvider extends ChangeNotifier {
  String? total;

  void calculateTotal(expenses) {
    double total = 0;
    for (var expense in expenses) {
      total += expense.amount;
    }
    this.total = total.toString();
  }

  // void logOut() async {
  //   final auth = FirebaseAuth.instance;
  //   await auth.signOut();
  // }
}
