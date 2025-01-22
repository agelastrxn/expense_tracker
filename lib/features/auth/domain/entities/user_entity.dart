class UserEntity {
  final String? uid;
  final String email;
  final String password;
  final String name;
  final String surName;
  // final String photoUrl;

  UserEntity({
    this.uid,
    required this.email,
    required this.password,
    required this.name,
    required this.surName,
    // required this.photoUrl,
  });
}
