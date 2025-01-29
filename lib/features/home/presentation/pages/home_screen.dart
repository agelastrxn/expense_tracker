import 'package:expense_tracker/app/constants/colors.dart';
import 'package:expense_tracker/app/constants/text_styles.dart';
import 'package:expense_tracker/app/constants/texts.dart';
import 'package:expense_tracker/features/auth/domain/entities/user_entity.dart';
import 'package:expense_tracker/features/home/presentation/pages/add_expense_screen.dart';
import 'package:expense_tracker/features/home/presentation/provider/expense_provider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  final UserEntity user;
  const HomeScreen({super.key, required this.user});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    final expenseProvider = Provider.of<ExpenseProvider>(context, listen: false);
    expenseProvider.getExpenses(userId: widget.user.uid!);
  }

  @override
  Widget build(BuildContext context) {
    final expenseProvider = Provider.of<ExpenseProvider>(context);
    final dates = expenseProvider.sortedDates;
    final expensesOnDate = expenseProvider.groupedExpenses;
    return Scaffold(
      appBar: AppBar(title: Text("${AppTexts.welcome} ${widget.user.name}")),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => showModalBottomSheet<void>(
          context: context,
          builder: (context) => AddExpenseScreen(userId: widget.user.uid!),
        ),
        label: Text(AppTexts.addExpense),
      ),
      body: ListView.builder(
        itemCount: expenseProvider.sortedDates.length,
        itemBuilder: (context, dateIndex) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  DateFormat('dd MMMM').format(dates[dateIndex]),
                  style: AppTextStyles.headline,
                ),
              ),
              ListView.builder(
                itemCount: expensesOnDate[dates[dateIndex]]!.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, expenseIndex) {
                  final current = expensesOnDate[dates[dateIndex]]!;
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: Dismissible(
                      direction: DismissDirection.endToStart,
                      key: UniqueKey(),
                      background: Container(
                        padding: EdgeInsets.only(right: 10),
                        alignment: Alignment.centerRight,
                        child: Text(AppTexts.delete, style: AppTextStyles.headline.copyWith(color: Colors.red)),
                      ),
                      onDismissed: (direction) {
                        expenseProvider.deleteExpense(
                          docId: current[expenseIndex].id,
                          userId: widget.user.uid!,
                        );
                        current.removeAt(expenseIndex);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: AppColors.secondary,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: ListTile(
                          title: Text(current[expenseIndex].title),
                          trailing: Text("${current[expenseIndex].amount.toString()} AZN"),
                        ),
                      ),
                    ),
                  );
                },
              )
            ],
          );
        },
      ),
    );
  }
}
