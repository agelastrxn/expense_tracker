import 'package:expense_tracker/core/get_it.dart';
import 'package:expense_tracker/features/auth/data/datasources/auth_datasource.dart';
import 'package:expense_tracker/features/auth/data/models/user_model.dart';
import 'package:expense_tracker/features/auth/domain/entities/user_entity.dart';
import 'package:expense_tracker/features/auth/domain/repositories/i_auth_repo.dart';

class AuthRepoImpl implements IAuthRepo {
  IAuthRemoteDataSource datasource = getIt.get();

  @override
  Future<UserModel> signInWithEmailAndPassword({required String email, required String password}) async {
    return await datasource.signInWithEmailAndPassword(email: email, password: password);
  }

  @override
  Future<UserModel> signUpWithEmailAndPassword({required UserEntity user}) async {
    return await datasource.signUpWithEmailAndPassword(user: user);
  }
}
