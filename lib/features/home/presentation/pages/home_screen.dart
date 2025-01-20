import 'package:expense_tracker/app/constants/texts.dart';
import 'package:expense_tracker/features/home/presentation/pages/add_expense_screen.dart';
import 'package:expense_tracker/features/home/presentation/provider/expense_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ExpenseProvider>(context, listen: true);
    return Scaffold(
      appBar: AppBar(title: Text('Welcome')),
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


// Consumer<ExpenseProvider>(
//         builder: (context, state, child) {
//           return ListView.builder(
//             itemCount: state.expenses.length,
//             itemBuilder: (context, index) {
//               return InkWell(
//                 onLongPress: () {
//                   state.deleteExpense(docId: state.expenses[index].date.toString());
//                 },
//                 child: ListTile(
//                   title: Text(state.expenses[index].expense),
//                   subtitle: Text(state.expenses[index].amount.toString()),
//                 ),
//               );
//             },
//           );
//         },
//       ),