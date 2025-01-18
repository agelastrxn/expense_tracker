import 'package:expense_tracker/features/auth/data/datasources/sign_in_remote_datasource.dart';
import 'package:expense_tracker/features/auth/domain/repositories/i_sign_in_repo.dart';

class SignInRepoImpl implements ISignInRepo {
  final SignInRemoteDatasourceImpl datasource;

  SignInRepoImpl({required this.datasource});

  @override
  Future signInWithEmailAndPassword({required String email, required String password}) async {
    return await datasource.signInWithEmailAndPassword(email: email, password: password);
  }
}
