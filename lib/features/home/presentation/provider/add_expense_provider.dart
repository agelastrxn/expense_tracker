import 'package:expense_tracker/features/home/data/datasources/add_expense_datasource.dart';
import 'package:expense_tracker/features/home/data/repositories/add_expense_impl.dart';
import 'package:expense_tracker/features/home/domain/entities/expense_entity.dart';
import 'package:expense_tracker/features/home/domain/repositories/i_add_expense_repo.dart';
import 'package:expense_tracker/features/home/domain/usecases/add_expense_usecase.dart';
import 'package:flutter/material.dart';

class AddExpenseProvider extends ChangeNotifier {
  Future<void> addExpense(ExpenseEntity expense) async {
    try {
      IAddExpenseRepo repo = AddExpenseImpl(datasource: AddExpenseDatasourceImpl());
      await AddExpenseUsecase(repo: repo).addExpense(expense);
      notifyListeners();
    } catch (e) {
      throw Exception(e);
    }
  }
}
