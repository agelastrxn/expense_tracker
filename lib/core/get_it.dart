import 'package:expense_tracker/features/auth/data/datasources/auth_datasource.dart';
import 'package:expense_tracker/features/auth/data/repository/auth_repo_impl.dart';
import 'package:expense_tracker/features/auth/domain/repositories/i_auth_repo.dart';
import 'package:expense_tracker/features/auth/domain/usecases/sign_in_email_usecase.dart';
import 'package:expense_tracker/features/auth/domain/usecases/sign_up_email_usecase.dart';
import 'package:expense_tracker/features/home/data/datasources/expense_datasource.dart';
import 'package:expense_tracker/features/home/data/repositories/expense_impl.dart';
import 'package:expense_tracker/features/home/domain/repositories/i_expense_repo.dart';
import 'package:expense_tracker/features/home/domain/usecases/add_expense_usecase.dart';
import 'package:expense_tracker/features/home/domain/usecases/delete_expense_usecase.dart';
import 'package:expense_tracker/features/home/domain/usecases/get_expenses_usecase.dart';
import 'package:expense_tracker/features/profile/data/datasources/profile_datasource.dart';
import 'package:expense_tracker/features/profile/data/repositories/profile_repo_impl.dart';
import 'package:expense_tracker/features/profile/domain/repositories/i_profile_repo.dart';
import 'package:expense_tracker/features/profile/domain/usecases/sign_out_usecase.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;

class Injection {
  static setUp() {
    // Data sources
    getIt.registerLazySingleton<IAuthRemoteDataSource>(() => AuthRemoteDatasourceImpl());
    getIt.registerLazySingleton<IExpenseDatasource>(() => ExpenseDatasourceImpl());
    getIt.registerLazySingleton<IProfileDataSource>(() => ProfileDataSourceImpl());

    // Repositories
    getIt.registerFactory<IAuthRepo>(() => AuthRepoImpl());
    getIt.registerFactory<IExpenseRepo>(() => ExpenseRepoImpl());
    getIt.registerFactory<IProfileRepo>(() => ProfileRepoImpl());

    // Use cases
    getIt.registerFactory(() => SignInWithEmailUseCase());
    getIt.registerFactory(() => SignUpWithEmailUsecase());
    getIt.registerFactory(() => AddExpenseUsecase());
    getIt.registerFactory(() => DeleteExpenseUseCase());
    getIt.registerFactory(() => GetExpensesUsecase());
    getIt.registerFactory(() => SignOutUsecase());
  }
}
