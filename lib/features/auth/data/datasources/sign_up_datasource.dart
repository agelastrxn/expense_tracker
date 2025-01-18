import 'package:expense_tracker/features/auth/domain/entities/user_entity.dart';
import 'package:firebase_auth/firebase_auth.dart';

final auth = FirebaseAuth.instance;

abstract class ISignUpDatasource {
  Future<void> signUpWithEmailAndPassword({required UserEntity user});
}

class SignUpDatasourceImpl implements ISignUpDatasource {
  @override
  Future<void> signUpWithEmailAndPassword({required UserEntity user}) async {
    await auth.createUserWithEmailAndPassword(email: user.email, password: user.password);
    print('User created');
  }
}
