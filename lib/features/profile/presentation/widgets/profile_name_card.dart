import 'package:expense_tracker/app/constants/colors.dart';
import 'package:expense_tracker/app/constants/text_styles.dart';
import 'package:expense_tracker/features/auth/domain/entities/user_entity.dart';
import 'package:flutter/material.dart';

double circleRadius = 50;

class ProfileNameCard extends StatelessWidget {
  const ProfileNameCard({
    super.key,
    required this.user,
  });

  final UserEntity user;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
      ),
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CircleAvatar(
            radius: circleRadius,
            child: Text('${user.name[0]}${user.surName[0]}', style: AppTextStyles.title),
          ),
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
    );
  }
}
