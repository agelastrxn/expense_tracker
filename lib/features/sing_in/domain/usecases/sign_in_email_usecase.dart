import 'package:expense_tracker/features/sing_in/domain/repositories/i_sign_in_repo.dart';

class SignInWithEmailAndPasswordUseCase {
  final ISignInRepo signInRepo;

  SignInWithEmailAndPasswordUseCase({required this.signInRepo});

  Future<void> singInWithEmailAndPasswordUsecase({required String email, required String password}) async {
    return await signInRepo.signInWithEmailAndPassword(email: email, password: password);
  }
}
