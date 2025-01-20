import 'package:expense_tracker/app/constants/text_styles.dart';
import 'package:expense_tracker/app/constants/texts.dart';
import 'package:expense_tracker/core/routes.dart';
import 'package:expense_tracker/features/auth/domain/entities/user_entity.dart';
import 'package:expense_tracker/features/auth/presentation/provider/auth_provider.dart';
import 'package:expense_tracker/shared/widgets/custom_text_field.dart';
import 'package:expense_tracker/features/auth/presentation/widgets/psw_text_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AuthProvider>(context);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(AppTexts.signUp, style: AppTextStyles.title),
            SizedBox(height: 10),
            CustomTextField(text: AppTexts.name, controller: provider.nameController),
            SizedBox(height: 10),
            CustomTextField(text: AppTexts.surName, controller: provider.surNameController),
            SizedBox(height: 10),
            CustomTextField(
              text: AppTexts.email,
              controller: provider.emailController,
            ),
            SizedBox(height: 10),
            PswTextField(
              controller: provider.pswController,
            ),
            SizedBox(height: 10),
            FilledButton(
              onPressed: () {
                UserEntity user = UserEntity(
                    name: provider.nameController.text,
                    surName: provider.surNameController.text,
                    email: provider.emailController.text,
                    password: provider.pswController.text);
                provider.signUpWithEmailAndPassword(user: user);
                Navigator.pushNamedAndRemoveUntil(context, Routes.home, (route) => false);
              },
              child: Text(AppTexts.signUp),
            ),
            SizedBox(height: 10),
            InkWell(
              onTap: () => Navigator.pushNamedAndRemoveUntil(context, Routes.singIn, (route) => route.settings.name == Routes.welcome),
              child: Text(AppTexts.alreadyHaveAnAccount, style: AppTextStyles.link),
            ),
          ],
        ),
      ),
    );
  }
}
