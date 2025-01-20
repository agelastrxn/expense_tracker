import 'package:expense_tracker/features/home/domain/entities/expense_entity.dart';

class ExpenseModel extends ExpenseEntity {
  ExpenseModel({
    required super.id,
    required super.expense,
    required super.amount,
    required super.date,
  });

  factory ExpenseModel.fromJson(Map<String, dynamic> json) {
    return ExpenseModel(
      id: json['id'],
      expense: json['expense'],
      amount: json['amount'],
      date: json['date'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'expense': expense,
      'amount': amount,
      'date': date,
    };
  }

  static ExpenseModel entityToModel(ExpenseEntity expense) {
    return ExpenseModel(
      id: expense.id,
      expense: expense.expense,
      amount: expense.amount,
      date: expense.date,
    );
  }
}


