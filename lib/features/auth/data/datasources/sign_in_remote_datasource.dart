import 'package:firebase_auth/firebase_auth.dart';

final _auth = FirebaseAuth.instance;

abstract class ISignInRemoteDataSource {
  Future<void> signInWithEmailAndPassword({required String email, required String password});
}

class SignInRemoteDatasourceImpl implements ISignInRemoteDataSource {
  @override
  Future<void> signInWithEmailAndPassword({required String email, required String password}) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      throw Exception(e);
    }
  }
}
