import 'package:expense_tracker/app/constants/text_styles.dart';
import 'package:expense_tracker/app/constants/texts.dart';
import 'package:expense_tracker/features/auth/presentation/provider/sign_in_provider.dart';
import 'package:expense_tracker/features/auth/presentation/widgets/custom_text_field.dart';
import 'package:expense_tracker/features/auth/presentation/widgets/psw_text_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    late String email;
    late String password;
    final provider = Provider.of<SignInProvider>(context);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(AppTexts.signIn, style: AppTextStyles.title),
            SizedBox(height: 10),
            CustomTextField(text: AppTexts.email, onChanged: (v) => email = v),
            SizedBox(height: 10),
            PswTextField(onChanged: (v) => password = v),
            SizedBox(height: 10),
            FilledButton(
              onPressed: () {
                provider.signInWithEmailAndPassword(email: email, password: password);
              },
              child: Text(AppTexts.signIn),
            ),
          ],
        ),
      ),
    );
  }
}
