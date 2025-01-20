import 'package:expense_tracker/features/home/data/datasources/expense_datasource.dart';
import 'package:expense_tracker/features/home/data/models/expense_model.dart';
import 'package:expense_tracker/features/home/domain/entities/expense_entity.dart';
import 'package:expense_tracker/features/home/domain/repositories/i_expense_repo.dart';

class ExpenseImpl implements IExpenseRepo {
  final ExpenseDatasourceImpl datasource;

  ExpenseImpl({required this.datasource});

  @override
  Future<void> addExpense({required ExpenseEntity expense}) {
    return datasource.addExpense(expense: ExpenseModel.entityToModel(expense));
  }

  @override
  Future<List<ExpenseModel>> getExpenses() async {
    return await datasource.getExpenses();
  }

  @override
  Future<void> deleteExpense({required String docId}) async {
    return datasource.deleteExpense(docId: docId);
  }
}
