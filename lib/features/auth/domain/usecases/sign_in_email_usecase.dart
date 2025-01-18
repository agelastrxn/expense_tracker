import 'package:expense_tracker/features/auth/domain/repositories/i_sign_in_repo.dart';

class SignInWithEmailAndPasswordUseCase {
  final ISignInRepo repo;

  SignInWithEmailAndPasswordUseCase({required this.repo});

  Future<void> singInWithEmailAndPasswordUsecase({required String email, required String password}) async {
    return await repo.signInWithEmailAndPassword(email: email, password: password);
  }
}
