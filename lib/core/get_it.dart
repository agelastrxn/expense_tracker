import 'package:expense_tracker/features/auth/data/datasources/sign_in_datasource.dart';
import 'package:expense_tracker/features/auth/data/datasources/sign_up_datasource.dart';
import 'package:expense_tracker/features/auth/data/repository/sign_in_repo_impl.dart';
import 'package:expense_tracker/features/auth/data/repository/sign_up_repo_impl.dart';
import 'package:expense_tracker/features/auth/domain/repositories/i_sign_in_repo.dart';
import 'package:expense_tracker/features/auth/domain/repositories/i_sign_up_repo.dart';
import 'package:expense_tracker/features/auth/domain/usecases/sign_in_email_usecase.dart';
import 'package:expense_tracker/features/auth/domain/usecases/sign_up_email_usecase.dart';
import 'package:expense_tracker/features/home/data/datasources/expense_datasource.dart';
import 'package:expense_tracker/features/home/data/repositories/expense_impl.dart';

import 'package:expense_tracker/features/home/domain/repositories/i_expense_repo.dart';
import 'package:expense_tracker/features/home/domain/usecases/add_expense_usecase.dart';
import 'package:expense_tracker/features/home/domain/usecases/delete_expense_usecase.dart';
import 'package:expense_tracker/features/home/domain/usecases/get_expenses_usecase.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;

class Injection {
  static setUp() {
    // Data sources
    getIt.registerLazySingleton<SignInRemoteDatasourceImpl>(() => SignInRemoteDatasourceImpl());
    getIt.registerLazySingleton<SignUpDatasourceImpl>(() => SignUpDatasourceImpl());
    getIt.registerLazySingleton<ExpenseDatasourceImpl>(() => ExpenseDatasourceImpl());

    // Repositories
    getIt.registerFactory<ISignInRepo>(() => SignInRepoImpl());
    getIt.registerFactory<ISignUpRepo>(() => SignUpRepoImpl());
    getIt.registerFactory<IExpenseRepo>(() => ExpenseRepoImpl());

    // Use cases
    getIt.registerFactory(() => SignInWithEmailUseCase());
    getIt.registerFactory(() => SignUpWithEmailUsecase());
    getIt.registerFactory(() => AddExpenseUsecase());
    getIt.registerFactory(() => DeleteExpenseUseCase());
    getIt.registerFactory(() => GetExpensesUsecase());
  }
}
