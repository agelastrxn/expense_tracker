import 'package:expense_tracker/core/get_it.dart';
import 'package:expense_tracker/features/profile/domain/usecases/sign_out_usecase.dart';
import 'package:flutter/material.dart';

class ProfileProvider extends ChangeNotifier {
  final SignOutUsecase signOutUsecase = getIt.get();
  String? total;

  void calculateTotal(expenses) {
    double total = 0;
    for (var expense in expenses) {
      total += expense.amount;
    }
    this.total = total.toString();
  }

  void logOut() async {
    await signOutUsecase.signOut();
  }
}
