import 'package:expense_tracker/core/get_it.dart';
import 'package:expense_tracker/features/auth/domain/entities/user_entity.dart';
import 'package:expense_tracker/features/auth/domain/repositories/i_sign_up_repo.dart';

class SignUpWithEmailUsecase {
  final ISignUpRepo repo = getIt.get();

  Future<UserEntity> signUpWithEmailAndPassword({required UserEntity user}) async {
    return await repo.signUpWithEmailAndPassword(user: user);
  }
}
