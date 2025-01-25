import 'package:expense_tracker/app/constants/text_styles.dart';
import 'package:expense_tracker/app/constants/texts.dart';
import 'package:expense_tracker/core/routes.dart';
import 'package:expense_tracker/features/auth/domain/entities/user_entity.dart';
import 'package:expense_tracker/features/home/domain/entities/expense_entity.dart';
import 'package:expense_tracker/features/profile/presentation/provider/profile_provider.dart';
import 'package:expense_tracker/features/profile/presentation/widgets/profile_name_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  final UserEntity user;
  final List<ExpenseEntity> expenses;
  const ProfileScreen({super.key, required this.user, required this.expenses});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProfileProvider>(context);
    provider.calculateTotal(expenses);
    void logOut() {
      provider.logOut();
      Navigator.pushNamedAndRemoveUntil(context, Routes.singIn, (route) => false);
    }

    return Scaffold(
      body: Column(
        children: [
          ProfileNameCard(user: user),
          SizedBox(height: 10),
          ListTile(title: Text(AppTexts.email, style: AppTextStyles.title), subtitle: Text(user.email)),
          SizedBox(height: 10),
          ListTile(title: Text(AppTexts.totalExpense, style: AppTextStyles.title), subtitle: Text('${provider.total!} AZN')),
          SizedBox(height: 10),
          ListTile(
              title: Text(AppTexts.theme, style: AppTextStyles.title),
              trailing: Switch(value: provider.themeToggle, onChanged: provider.changeTheme)),
          Expanded(child: SizedBox()),
          FilledButton(onPressed: () => logOut(), child: Text(AppTexts.logOut)),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
