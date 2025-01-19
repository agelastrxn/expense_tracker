import 'package:expense_tracker/app/constants/text_styles.dart';
import 'package:expense_tracker/app/constants/texts.dart';
import 'package:expense_tracker/core/routes.dart';
import 'package:expense_tracker/features/auth/domain/entities/user_entity.dart';
import 'package:expense_tracker/features/auth/presentation/provider/sign_up_provider.dart';
import 'package:expense_tracker/shared/widgets/custom_text_field.dart';
import 'package:expense_tracker/features/auth/presentation/widgets/psw_text_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    late String name;
    late String surName;
    late String email;
    late String password;
    final provider = Provider.of<SignUpProvider>(context);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(AppTexts.signUp, style: AppTextStyles.title),
            SizedBox(height: 10),
            CustomTextField(text: AppTexts.name, onChanged: (v) => name = v),
            SizedBox(height: 10),
            CustomTextField(text: AppTexts.surName, onChanged: (v) => surName = v),
            SizedBox(height: 10),
            CustomTextField(text: AppTexts.email, onChanged: (v) => email = v),
            SizedBox(height: 10),
            PswTextField(onChanged: (v) => password = v),
            SizedBox(height: 10),
            FilledButton(
              onPressed: () {
                UserEntity user = UserEntity(name: name, surName: surName, email: email, password: password);
                provider.signUpWithEmailAndPassword(user: user);
                Navigator.pushNamedAndRemoveUntil(context, Routes.home, (route) => false);
              },
              child: Text(AppTexts.signUp),
            ),
            SizedBox(height: 10),
            InkWell(
              onTap: () => Navigator.pushNamedAndRemoveUntil(context, Routes.singIn, (route) => route.settings.name == Routes.welcome),
              child: Text(AppTexts.notHaveAnAccount, style: AppTextStyles.link),
            ),
          ],
        ),
      ),
    );
  }
}
