import 'package:expense_tracker/features/auth/data/datasources/sign_in_remote_datasource.dart';
import 'package:expense_tracker/features/auth/data/datasources/sign_up_datasource.dart';
import 'package:expense_tracker/features/auth/data/repository/sign_in_repo_impl.dart';
import 'package:expense_tracker/features/auth/data/repository/sign_up_repo_impl.dart';
import 'package:expense_tracker/features/auth/domain/entities/user_entity.dart';
import 'package:expense_tracker/features/auth/domain/repositories/i_sign_in_repo.dart';
import 'package:expense_tracker/features/auth/domain/repositories/i_sign_up_repo.dart';
import 'package:expense_tracker/features/auth/domain/usecases/sign_in_email_usecase.dart';
import 'package:expense_tracker/features/auth/domain/usecases/sign_up_email_usecase.dart';
import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController pswController = TextEditingController();
  final nameController = TextEditingController();
  final surNameController = TextEditingController();

  Future<void> signInWithEmailAndPassword({required String email, required String password}) async {
    try {
      ISignInRepo repo = SignInRepoImpl(datasource: SignInRemoteDatasourceImpl());
      await SignInWithEmailAndPasswordUseCase(repo: repo).singInWithEmailAndPasswordUsecase(email: email, password: password);
      notifyListeners();
    } catch (e) {
      throw Exception(e);
    }
  }

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
