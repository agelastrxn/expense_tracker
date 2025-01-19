import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expense_tracker/app/constants/texts.dart';
import 'package:expense_tracker/features/home/domain/entities/expense_entity.dart';
import 'package:expense_tracker/features/home/presentation/provider/expense_provider.dart';
import 'package:expense_tracker/shared/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddExpenseScreen extends StatelessWidget {
  const AddExpenseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ExpenseProvider>(context);
    final expenseController = provider.expenseController;
    final amountController = provider.amountController;
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          CustomTextField(
            text: AppTexts.expense,
            controller: expenseController,
          ),
          SizedBox(height: 10),
          CustomTextField(
            text: AppTexts.amount,
            controller: amountController,
            keyboardType: TextInputType.number,
          ),
          SizedBox(height: 10),
          FilledButton(
              onPressed: () {
                ExpenseEntity newExpense = ExpenseEntity(
                  expense: expenseController.text,
                  amount: double.parse(amountController.text),
                  date: Timestamp.now(),
                );
                provider.addExpense(newExpense);
                Navigator.pop(context);
              },
              child: Text(AppTexts.addExpense)),
        ],
      ),
    );
  }
}
