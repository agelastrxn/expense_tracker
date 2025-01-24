import 'package:expense_tracker/core/get_it.dart';
import 'package:expense_tracker/features/profile/domain/repositories/i_profile_repo.dart';

class SignOutUsecase {
  final IProfileRepo repo = getIt.get();

  Future<void> signOut() async {
    return await repo.signOut();
  }
}
