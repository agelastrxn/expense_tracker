import 'package:cloud_firestore/cloud_firestore.dart';

class ExpenseEntity {
  final String id;
  final String title;
  final double amount;
  final Timestamp date;

  const ExpenseEntity({
    required this.id,
    required this.title,
    required this.amount,
    required this.date,
  });
}
