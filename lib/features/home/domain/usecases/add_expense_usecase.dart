import 'package:expense_tracker/features/home/domain/entities/expense_entity.dart';
import 'package:expense_tracker/features/home/domain/repositories/i_expense_repo.dart';

class AddExpenseUsecase {
  final IExpenseRepo repo;

  AddExpenseUsecase({required this.repo});

  Future<void> addExpense(ExpenseEntity expense, String userId) async {
    await repo.addExpense(expense: expense, userId: userId);
  }
}
