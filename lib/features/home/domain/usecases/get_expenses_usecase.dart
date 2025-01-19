import 'package:expense_tracker/features/home/domain/entities/expense_entity.dart';
import 'package:expense_tracker/features/home/domain/repositories/i_expense_repo.dart';

class GetExpensesUsecase {
  final IExpenseRepo repo;

  GetExpensesUsecase({required this.repo});

  Future<List<ExpenseEntity>> getExpenses() async {
    return await repo.getExpenses();
  }
}
