import 'package:expense_tracker/features/auth/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({
    super.uid,
    required super.email,
    required super.password,
    required super.name,
    required super.surName,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      uid: json['uid'],
      email: json['email'],
      password: json['password'],
      name: json['name'],
      surName: json['surName'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'email': email,
      'password': password,
      'name': name,
      'surName': surName,
    };
  }

  static entityToModel({required UserEntity userEntity}) {
    return UserModel(
      uid: userEntity.uid,
      email: userEntity.email,
      password: userEntity.password,
      name: userEntity.name,
      surName: userEntity.surName,
    );
  }
}
