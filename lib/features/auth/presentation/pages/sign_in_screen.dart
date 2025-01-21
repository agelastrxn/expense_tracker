import 'package:expense_tracker/app/constants/text_styles.dart';
import 'package:expense_tracker/app/constants/texts.dart';
import 'package:expense_tracker/core/routes.dart';
import 'package:expense_tracker/features/auth/presentation/provider/auth_provider.dart';
import 'package:expense_tracker/shared/widgets/custom_text_field.dart';
import 'package:expense_tracker/features/auth/presentation/widgets/psw_text_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AuthProvider>(context);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(AppTexts.signIn, style: AppTextStyles.title),
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
              onPressed: ()  async {
                await provider.signInWithEmailAndPassword(
                  email: provider.emailController.text,
                  password: provider.pswController.text,
                );
                if (!context.mounted) return;
                Navigator.pushNamedAndRemoveUntil(context, Routes.home, (route) => false, arguments: provider.currentUser);
              },
              child: Text(AppTexts.signIn),
            ),
            SizedBox(height: 10),
            InkWell(
              onTap: () => Navigator.pushNamedAndRemoveUntil(context, Routes.signUp, (route) => route.settings.name == Routes.welcome),
              child: Text(AppTexts.notHaveAnAccount, style: AppTextStyles.link),
            ),
          ],
        ),
      ),
    );
  }
}
