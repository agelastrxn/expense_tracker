import 'package:expense_tracker/app/constants/texts.dart';
import 'package:expense_tracker/features/auth/domain/entities/user_entity.dart';
import 'package:expense_tracker/features/home/presentation/pages/add_expense_screen.dart';
import 'package:expense_tracker/features/home/presentation/provider/expense_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  final UserEntity user;
  const HomeScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    final expenseProvider = Provider.of<ExpenseProvider>(context);
    getExpenses(expenseProvider);
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => showModalBottomSheet<void>(
          context: context,
          builder: (context) => AddExpenseScreen(userId: user.uid!),
        ),
        label: Text(AppTexts.addExpense),
      ),
      appBar: AppBar(title: Text("${AppTexts.welcome} ${user.name}")),
      body: ListView.builder(
        itemCount: expenseProvider.expenses.length,
        itemBuilder: (context, index) {
          return InkWell(
            onLongPress: () {
              expenseProvider.deleteExpense(docId: expenseProvider.expenses[index].date.toString(), userId: user.uid!);
            },
            child: ListTile(
              title: Text(expenseProvider.expenses[index].expense),
              subtitle: Text(expenseProvider.expenses[index].amount.toString()),
            ),
          );
        },
      ),
    );
  }

  void getExpenses(ExpenseProvider provider) async {
    await provider.getExpenses(userId: user.uid!);
  }
}
