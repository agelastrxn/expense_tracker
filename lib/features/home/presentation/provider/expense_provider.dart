import 'package:expense_tracker/core/get_it.dart';
import 'package:expense_tracker/features/home/domain/entities/expense_entity.dart';
import 'package:expense_tracker/features/home/domain/usecases/add_expense_usecase.dart';
import 'package:expense_tracker/features/home/domain/usecases/delete_expense_usecase.dart';
import 'package:expense_tracker/features/home/domain/usecases/get_expenses_usecase.dart';
import 'package:flutter/material.dart';

class ExpenseProvider extends ChangeNotifier {
  final GetExpensesUsecase getExpensesUsecase = getIt.get();
  final AddExpenseUsecase addExpenseUsecase = getIt.get();
  final DeleteExpenseUseCase deleteExpenseUseCase = getIt.get();
  TextEditingController expenseController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  List<ExpenseEntity> expenses = [];

  Future<void> getExpenses({required String userId}) async {
    try {
      final expenses = await getExpensesUsecase.getExpenses(userId: userId);
      this.expenses = expenses;
      notifyListeners();
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> addExpense(ExpenseEntity expense, String userId) async {
    try {
      await addExpenseUsecase.addExpense(expense, userId);
      clearController();
      getExpenses(userId: userId);
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> deleteExpense({required String docId, required String userId}) async {
    await deleteExpenseUseCase.deleteExpense(docId: docId, userId: userId);
    getExpenses(userId: userId);
    notifyListeners();
  }

  void clearController() {
    expenseController.clear();
    amountController.clear();
  }
}
