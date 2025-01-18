import 'package:expense_tracker/features/sing_in/data/datasource/remote_datasource/sign_in_remote_datasource.dart';
import 'package:expense_tracker/features/sing_in/data/repositories/sign_in_repo_impl.dart';
import 'package:expense_tracker/features/sing_in/domain/repositories/i_sign_in_repo.dart';
import 'package:expense_tracker/features/sing_in/domain/usecases/sign_in_email_usecase.dart';
import 'package:flutter/material.dart';

class SingInProvider extends ChangeNotifier {
  ISignInRepo signInRepo = SignInRepoImpl(datasource: SignInRemoteDatasourceImpl());
  Future<void> signInWithEmailAndPassword({required String email, required String password}) async {
    try {
      SignInWithEmailAndPasswordUseCase(signInRepo: signInRepo).singInWithEmailAndPasswordUsecase(email: email, password: password);
      print('User signed in');
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }
}
