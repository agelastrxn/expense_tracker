import 'package:expense_tracker/features/home/data/datasources/expense_datasource.dart';
import 'package:expense_tracker/features/home/data/models/expense_model.dart';
import 'package:expense_tracker/features/home/domain/entities/expense_entity.dart';
import 'package:expense_tracker/features/home/domain/repositories/i_expense_repo.dart';

class ExpenseImpl implements IExpenseRepo {
  final ExpenseDatasourceImpl datasource;

  ExpenseImpl({required this.datasource});

  @override
  Future<void> addExpense({required ExpenseEntity expense, required String userId}) async {
    return await datasource.addExpense(expense: ExpenseModel.entityToModel(expense), userId: userId);
  }

  @override
  Future<List<ExpenseModel>> getExpenses({required String userId}) async {
    return await datasource.getExpenses(userId: userId);
  }

  @override
  Future<void> deleteExpense({required String docId, required String userId}) async {
    return await datasource.deleteExpense(docId: docId, userId: userId);
  }
}
