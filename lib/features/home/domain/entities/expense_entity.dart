import 'package:cloud_firestore/cloud_firestore.dart';

class ExpenseEntity {
  final String expense;
  final double amount;
  final Timestamp date;

  const ExpenseEntity({
    required this.expense,
    required this.amount,
    required this.date,
  });
}
