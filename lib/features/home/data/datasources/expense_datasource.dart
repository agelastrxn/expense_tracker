import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expense_tracker/features/home/data/models/expense_model.dart';

final storage = FirebaseFirestore.instance;

abstract class IExpenseDatasource {
  Future<void> addExpense({required ExpenseModel expense});
  Future<List<ExpenseModel>> getExpenses();
}

class ExpenseDatasourceImpl implements IExpenseDatasource {
  @override
  Future<void> addExpense({required ExpenseModel expense}) async {
    await storage.collection('expenses').add(expense.toJson());
  }

  @override
  Future<List<ExpenseModel>> getExpenses() async {
    final snapshot = await storage.collection('expenses').get();
    return snapshot.docs.map((e) => ExpenseModel.fromJson(e.data())).toList();
  }
}
