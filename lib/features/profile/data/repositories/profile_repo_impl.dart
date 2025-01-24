import 'package:expense_tracker/core/get_it.dart';
import 'package:expense_tracker/features/profile/data/datasources/profile_datasource.dart';
import 'package:expense_tracker/features/profile/domain/repositories/i_profile_repo.dart';

class ProfileRepoImpl implements IProfileRepo {
  final IProfileDataSource dataSource = getIt.get();

  @override
  Future<void> signOut() async {
    return await dataSource.signOut();
  }
}
