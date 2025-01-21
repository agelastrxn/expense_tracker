import 'package:expense_tracker/features/auth/domain/entities/user_entity.dart';
import 'package:expense_tracker/features/home/data/models/expense_model.dart';

class UserModel extends UserEntity {
  UserModel({
    super.uid,
    required super.email,
    required super.password,
    required super.name,
    required super.surName,
    required super.expenses,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        uid: json['uid'],
        email: json['email'],
        password: json['password'],
        name: json['name'],
        surName: json['surName'],
        expenses: (json['expenses'] as List<dynamic>?)!.map((expense) => ExpenseModel.fromJson(expense)).toList());
  }

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'email': email,
      'password': password,
      'name': name,
      'surName': surName,
      'expenses': expenses,
    };
  }

  static entityToModel({required UserEntity userEntity}) {
    return UserModel(
      uid: userEntity.uid,
      email: userEntity.email,
      password: userEntity.password,
      name: userEntity.name,
      surName: userEntity.surName,
      expenses: userEntity.expenses,
    );
  }
}
