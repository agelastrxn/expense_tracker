import 'package:expense_tracker/features/home/domain/entities/expense_entity.dart';
import 'package:expense_tracker/features/home/domain/repositories/i_add_expense_repo.dart';

class AddExpenseUsecase {
  final IAddExpenseRepo repo;

  AddExpenseUsecase({required this.repo});

  Future<void> addExpense(ExpenseEntity expense) async {
    await repo.addExpense(expense: expense);
  }
}
