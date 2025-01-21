import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expense_tracker/features/auth/data/models/user_model.dart';

import 'package:firebase_auth/firebase_auth.dart';

final _auth = FirebaseAuth.instance;
final _storage = FirebaseFirestore.instance;

abstract class ISignInRemoteDataSource {
  Future<UserModel> signInWithEmailAndPassword({required String email, required String password});
}

class SignInRemoteDatasourceImpl implements ISignInRemoteDataSource {
  @override
  Future<UserModel> signInWithEmailAndPassword({required String email, required String password}) async {
    try {
      final createdUser = await _auth.signInWithEmailAndPassword(email: email, password: password);
      String uid = createdUser.user!.uid;
      DocumentSnapshot userDoc = await _storage.collection('users').doc(uid).get();
      final user = UserModel.fromJson(userDoc.data() as Map<String, dynamic>);
      return user;
    } catch (e) {
      throw Exception(e);
    }
  }
}
