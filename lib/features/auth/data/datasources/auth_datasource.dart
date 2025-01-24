import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expense_tracker/features/auth/data/models/user_model.dart';
import 'package:expense_tracker/features/auth/domain/entities/user_entity.dart';
import 'package:firebase_auth/firebase_auth.dart';

final _auth = FirebaseAuth.instance;
final _storage = FirebaseFirestore.instance;

abstract class IAuthRemoteDataSource {
  Future<UserModel> signUpWithEmailAndPassword({required UserEntity user});
  Future<UserModel> signInWithEmailAndPassword({required String email, required String password});
  Future<void> signOut();
}
//-----------------------------------------------------------------------------------------------------------

class AuthRemoteDatasourceImpl implements IAuthRemoteDataSource {
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

  @override
  Future<UserModel> signUpWithEmailAndPassword({required UserEntity user}) async {
    final createdUser = await _auth.createUserWithEmailAndPassword(email: user.email, password: user.password);
    final userModel = UserModel(
      uid: createdUser.user!.uid,
      email: createdUser.user!.email!,
      password: user.password,
      name: user.name,
      surName: user.surName,
    );
    await saveUserToFirestore(userModel);
    return userModel;
  }

  @override
  Future<void> signOut() async {
    await _auth.signOut();
  }

  Future<void> saveUserToFirestore(UserEntity user) async {
    UserModel userModel = UserModel.entityToModel(userEntity: user);
    await _storage.collection('users').doc(user.uid).set(userModel.toJson());
  }
}
