import 'package:expense_tracker/features/auth/domain/entities/user_entity.dart';
import 'package:expense_tracker/features/auth/domain/repositories/i_sign_up_repo.dart';

class SignUpEmailUsecase {
  final ISignUpRepo repo;

  SignUpEmailUsecase({required this.repo});

  Future<UserEntity> signUpWithEmailAndPassword({required UserEntity user}) async {
    return await repo.signUpWithEmailAndPassword(user: user);
  }
}
