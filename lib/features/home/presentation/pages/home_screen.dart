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
    final provider = Provider.of<ExpenseProvider>(context, listen: true);
    return Scaffold(
      appBar: AppBar(title: Text("${AppTexts.welcome} ${user.name} 👋")),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () => showModalBottomSheet<void>(context: context, builder: (context) => AddExpenseScreen()),
          label: Text(AppTexts.addExpense)),
      body: ListView.builder(
        itemCount: provider.expenses.length,
        itemBuilder: (context, index) {
          return InkWell(
            onLongPress: () {
              provider.deleteExpense(docId: provider.expenses[index].date.toString());
            },
            child: ListTile(
              title: Text(provider.expenses[index].expense),
              subtitle: Text(provider.expenses[index].amount.toString()),
            ),
          );
        },
      ),
    );
  }
}
