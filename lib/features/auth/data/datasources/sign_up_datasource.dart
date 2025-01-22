import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expense_tracker/features/auth/data/models/user_model.dart';
import 'package:expense_tracker/features/auth/domain/entities/user_entity.dart';
import 'package:firebase_auth/firebase_auth.dart';

final auth = FirebaseAuth.instance;
final storage = FirebaseFirestore.instance;

//---------------------------------------------------------------------
abstract class ISignUpDatasource {
  Future<UserModel> signUpWithEmailAndPassword({required UserEntity user});
}
//---------------------------------------------------------------------

class SignUpDatasourceImpl implements ISignUpDatasource {
  @override
  Future<UserModel> signUpWithEmailAndPassword({required UserEntity user}) async {
    final createdUser = await auth.createUserWithEmailAndPassword(email: user.email, password: user.password);
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

  Future<void> saveUserToFirestore(UserEntity user) async {
    UserModel userModel = UserModel.entityToModel(userEntity: user);
    await storage.collection('users').doc(user.uid).set(userModel.toJson());
  }
}
