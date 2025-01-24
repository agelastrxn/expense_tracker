import 'package:expense_tracker/core/get_it.dart';
import 'package:expense_tracker/features/home/domain/entities/expense_entity.dart';
import 'package:expense_tracker/features/home/domain/repositories/i_expense_repo.dart';

class GetExpensesUsecase {
  IExpenseRepo repo = getIt.get();

  Future<List<ExpenseEntity>> getExpenses({required String userId}) async {
    return await repo.getExpenses(userId: userId);
  }
}
