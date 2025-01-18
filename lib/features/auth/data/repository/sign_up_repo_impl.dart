import 'package:expense_tracker/features/auth/data/datasources/sign_up_datasource.dart';
import 'package:expense_tracker/features/auth/domain/entities/user_entity.dart';
import 'package:expense_tracker/features/auth/domain/repositories/i_sign_up_repo.dart';

class SignUpRepoImpl implements ISignUpRepo {
  final SignUpDatasourceImpl datasource;

  SignUpRepoImpl({required this.datasource});

  @override
  Future signUpWithEmailAndPassword({required UserEntity user}) async {
    return await datasource.signUpWithEmailAndPassword(user: user);
  }
}
