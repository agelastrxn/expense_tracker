import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expense_tracker/features/home/data/models/expense_model.dart';

final storage = FirebaseFirestore.instance;

abstract class IExpenseDatasource {
  Future<void> addExpense({required ExpenseModel expense, required String userId});
  Future<List<ExpenseModel>> getExpenses({required String userId});
  Future<void> deleteExpense({required String docId, required String userId});
}

class ExpenseDatasourceImpl implements IExpenseDatasource {
  @override
  Future<void> addExpense({required ExpenseModel expense, required String userId}) async {
    await storage.collection('userExpenses').doc(userId).collection('expenseList').doc(expense.id).set(expense.toJson());
  }

  @override
  Future<List<ExpenseModel>> getExpenses({required String userId}) async {
    try {
      final snapshot = await storage.collection('userExpenses').doc(userId).collection('expenseList').get();
      final expenses = snapshot.docs.map((e) => ExpenseModel.fromJson(e.data())).toList();
      return expenses;
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<void> deleteExpense({required String docId, required String userId}) async {
    await storage.collection('userExpenses').doc(userId).collection("expenseList").doc(docId).delete();
  }
}
