import 'package:expense_tracker/app/constants/texts.dart';
import 'package:expense_tracker/features/home/domain/entities/expense_entity.dart';
import 'package:expense_tracker/features/home/presentation/provider/add_expense_provider.dart';
import 'package:expense_tracker/shared/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddExpenseScreen extends StatelessWidget {
  const AddExpenseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AddExpenseProvider>(context);
    late String expense;
    late double amount;
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          CustomTextField(text: AppTexts.expense, onChanged: (v) => expense = v),
          SizedBox(height: 10),
          CustomTextField(text: AppTexts.amount, onChanged: (v) => amount = double.parse(v)),
          SizedBox(height: 10),
          FilledButton(
              onPressed: () {
                ExpenseEntity newExpense = ExpenseEntity(expense: expense, amount: amount, date: DateTime.now());
                provider.addExpense(newExpense);
                Navigator.pop(context);
              },
              child: Text(AppTexts.addExpense)),
        ],
      ),
    );
  }
}
