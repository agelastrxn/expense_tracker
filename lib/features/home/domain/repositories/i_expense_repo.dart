import 'package:expense_tracker/features/home/domain/entities/expense_entity.dart';

abstract class IExpenseRepo {
  Future<void> addExpense({required ExpenseEntity expense});
  Future<List<ExpenseEntity>> getExpenses();
}
