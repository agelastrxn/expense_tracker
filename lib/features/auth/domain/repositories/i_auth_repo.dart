import 'package:expense_tracker/features/auth/domain/entities/user_entity.dart';

abstract class IAuthRepo {
  Future<UserEntity> signInWithEmailAndPassword({required String email, required String password});
  Future<UserEntity> signUpWithEmailAndPassword({required UserEntity user});

}
