import 'package:expense_tracker/features/home/data/datasources/expense_datasource.dart';
import 'package:expense_tracker/features/home/data/repositories/expense_impl.dart';
import 'package:expense_tracker/features/home/domain/entities/expense_entity.dart';
import 'package:expense_tracker/features/home/domain/repositories/i_expense_repo.dart';
import 'package:expense_tracker/features/home/domain/usecases/add_expense_usecase.dart';
import 'package:expense_tracker/features/home/domain/usecases/get_expenses_usecase.dart';
import 'package:flutter/material.dart';

class ExpenseProvider extends ChangeNotifier {
  TextEditingController expenseController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  List<ExpenseEntity> expenses = [];

  ExpenseProvider() {
    getExpenses();
  }

  Future<void> getExpenses() async {
    try {
      final IExpenseRepo repo = ExpenseImpl(datasource: ExpenseDatasourceImpl());
      final List<ExpenseEntity> expenses = await GetExpensesUsecase(repo: repo).getExpenses();
      this.expenses = expenses;
      notifyListeners();
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> addExpense(ExpenseEntity expense) async {
    try {
      IExpenseRepo repo = ExpenseImpl(datasource: ExpenseDatasourceImpl());
      await AddExpenseUsecase(repo: repo).addExpense(expense);
      clearController();
      getExpenses();
    } catch (e) {
      throw Exception(e);
    }
  }

  void clearController() {
    expenseController.clear();
    amountController.clear();
  }
}
