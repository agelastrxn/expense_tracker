import 'package:expense_tracker/features/home/domain/entities/expense_entity.dart';

abstract class IExpenseRepo {
  Future<void> addExpense({required ExpenseEntity expense, required String userId});
  Future<List<ExpenseEntity>> getExpenses({required String userId});
  Future<void> deleteExpense({required String docId, required String userId});
}
