import 'package:expense_tracker/features/home/presentation/pages/add_expense_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Welcome')),
        floatingActionButton: FloatingActionButton.extended(
            onPressed: () => showModalBottomSheet<void>(context: context, builder: (context) => AddExpenseScreen()),
            label: Text('Add Expense')),
        body: Column(
          children: [
            ListTile(title: Text('Expense 1')),
            ListTile(title: Text('Expense 1')),
            ListTile(title: Text('Expense 1')),
          ],
        ));
  }
}
