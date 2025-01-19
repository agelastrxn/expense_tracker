import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expense_tracker/features/home/data/models/expense_model.dart';

final storage = FirebaseFirestore.instance;

abstract class IAddExpenseDatasource {
  Future<void> addExpense({required ExpenseModel expense});
}

class AddExpenseDatasourceImpl implements IAddExpenseDatasource {
  @override
  Future<void> addExpense({required ExpenseModel expense}) async {
    await storage.collection('expenses').add(expense.toJson());
  }
}
