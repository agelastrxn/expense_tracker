import 'package:expense_tracker/core/get_it.dart';
import 'package:expense_tracker/features/home/data/datasources/expense_datasource.dart';
import 'package:expense_tracker/features/home/data/models/expense_model.dart';
import 'package:expense_tracker/features/home/domain/entities/expense_entity.dart';
import 'package:expense_tracker/features/home/domain/repositories/i_expense_repo.dart';

class ExpenseRepoImpl implements IExpenseRepo {
  final IExpenseDatasource datasource = getIt.get();

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
