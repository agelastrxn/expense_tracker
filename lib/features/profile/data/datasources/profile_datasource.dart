import 'package:expense_tracker/core/get_it.dart';
import 'package:expense_tracker/features/auth/data/datasources/auth_datasource.dart';

IAuthRemoteDataSource auth = getIt.get();

abstract class IProfileDataSource {
  Future<void> signOut();
}

class ProfileDataSourceImpl implements IProfileDataSource {
  @override
  Future<void> signOut() async => await auth.signOut();
}
