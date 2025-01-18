import 'package:expense_tracker/features/auth/domain/entities/user_entity.dart';

abstract class ISignUpRepo {
  Future<void> signUpWithEmailAndPassword({required UserEntity user});
}