import 'package:expense_tracker/features/home/domain/entities/expense_entity.dart';

abstract class IAddExpenseRepo {
  Future<void> addExpense({required ExpenseEntity expense});
}