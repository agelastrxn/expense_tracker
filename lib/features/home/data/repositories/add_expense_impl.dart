import 'package:expense_tracker/features/home/data/datasources/add_expense_datasource.dart';
import 'package:expense_tracker/features/home/data/models/expense_model.dart';
import 'package:expense_tracker/features/home/domain/entities/expense_entity.dart';
import 'package:expense_tracker/features/home/domain/repositories/i_add_expense_repo.dart';

class AddExpenseImpl implements IAddExpenseRepo {
  final AddExpenseDatasourceImpl datasource;

  AddExpenseImpl({required this.datasource});

  @override
  Future<void> addExpense({required ExpenseEntity expense}) {
    return datasource.addExpense(expense: ExpenseModel.entityToModel(expense));
  }
}
