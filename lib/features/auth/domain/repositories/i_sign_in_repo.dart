import 'package:expense_tracker/features/auth/domain/entities/user_entity.dart';

abstract class ISignInRepo {
  Future<UserEntity> signInWithEmailAndPassword({required String email, required String password});
}
