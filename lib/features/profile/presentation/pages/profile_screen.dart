import 'package:expense_tracker/app/constants/colors.dart';
import 'package:expense_tracker/app/constants/text_styles.dart';
import 'package:expense_tracker/app/constants/texts.dart';
import 'package:expense_tracker/core/routes.dart';
import 'package:expense_tracker/features/auth/domain/entities/user_entity.dart';
import 'package:expense_tracker/features/home/domain/entities/expense_entity.dart';
import 'package:expense_tracker/features/profile/presentation/provider/profile_provider.dart';
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
    return Scaffold(
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(color: AppColors.primary, borderRadius: BorderRadius.vertical(bottom: Radius.circular(20))),
            height: 200,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CircleAvatar(radius: 50, child: Text('${user.name[0]}${user.surName[0]}', style: AppTextStyles.title)),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(user.name, style: AppTextStyles.title),
                    Text(user.surName, style: AppTextStyles.title),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          ListTile(title: Text(AppTexts.email, style: AppTextStyles.title), subtitle: Text(user.email)),
          SizedBox(height: 10),
          ListTile(title: Text(AppTexts.totalExpense, style: AppTextStyles.title), subtitle: Text(provider.total!)),
          Expanded(child: SizedBox()),
          FilledButton(
              onPressed: () {
                provider.logOut();
                Navigator.pushNamedAndRemoveUntil(context, Routes.singIn, (route) => false);
              },
              child: Text(AppTexts.logOut)),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
