import 'package:expense_tracker/features/auth/data/datasources/sign_up_datasource.dart';
import 'package:expense_tracker/features/auth/data/repository/sign_up_repo_impl.dart';
import 'package:expense_tracker/features/auth/domain/entities/user_entity.dart';
import 'package:expense_tracker/features/auth/domain/repositories/i_sign_up_repo.dart';
import 'package:expense_tracker/features/auth/domain/usecases/sign_up_email_usecase.dart';
import 'package:flutter/material.dart';

class SignUpProvider extends ChangeNotifier {
  Future<void> signUpWithEmailAndPassword({required UserEntity user}) async {
    try {
      ISignUpRepo repo = SignUpRepoImpl(datasource: SignUpDatasourceImpl());
      await SignUpEmailUsecase(repo: repo).signUpWithEmailAndPassword(user: user);
      notifyListeners();
    } catch (e) {
      throw Exception(e);
    }
  }
}
