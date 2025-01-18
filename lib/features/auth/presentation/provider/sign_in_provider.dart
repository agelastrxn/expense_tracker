import 'package:expense_tracker/features/auth/data/datasources/sign_in_remote_datasource.dart';
import 'package:expense_tracker/features/auth/data/repository/sign_in_repo_impl.dart';
import 'package:expense_tracker/features/auth/domain/repositories/i_sign_in_repo.dart';
import 'package:expense_tracker/features/auth/domain/usecases/sign_in_email_usecase.dart';
import 'package:flutter/material.dart';

class SignInProvider extends ChangeNotifier {
  Future<void> signInWithEmailAndPassword({required String email, required String password}) async {
    try {
      ISignInRepo repo = SignInRepoImpl(datasource: SignInRemoteDatasourceImpl());
      await SignInWithEmailAndPasswordUseCase(repo: repo).singInWithEmailAndPasswordUsecase(email: email, password: password);
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }
}
