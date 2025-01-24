import 'package:expense_tracker/core/get_it.dart';
import 'package:expense_tracker/features/auth/domain/entities/user_entity.dart';
import 'package:expense_tracker/features/auth/domain/usecases/sign_in_email_usecase.dart';
import 'package:expense_tracker/features/auth/domain/usecases/sign_up_email_usecase.dart';
import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  final SignInWithEmailUseCase signInUseCase = getIt.get();
  final SignUpWithEmailUsecase signUpUseCase = getIt.get();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController pswController = TextEditingController();
  final nameController = TextEditingController();
  final surNameController = TextEditingController();
  UserEntity? currentUser;

  Future<void> signInWithEmailAndPassword({required String email, required String password}) async {
    try {
      currentUser = await signInUseCase.singInWithEmailAndPasswordUsecase(email: email, password: password);
      notifyListeners();
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> signUpWithEmailAndPassword({required UserEntity user}) async {
    try {
      currentUser = await signUpUseCase.signUpWithEmailAndPassword(user: user);
      notifyListeners();
    } catch (e) {
      throw Exception(e);
    }
  }
}
