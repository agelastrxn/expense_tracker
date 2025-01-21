import 'package:expense_tracker/features/auth/domain/entities/user_entity.dart';
import 'package:expense_tracker/features/auth/domain/repositories/i_sign_in_repo.dart';

class SignInWithEmailAndPasswordUseCase {
  final ISignInRepo repo;

  SignInWithEmailAndPasswordUseCase({required this.repo});

  Future<UserEntity> singInWithEmailAndPasswordUsecase({required String email, required String password}) async {
    return await repo.signInWithEmailAndPassword(email: email, password: password);
  }
}
