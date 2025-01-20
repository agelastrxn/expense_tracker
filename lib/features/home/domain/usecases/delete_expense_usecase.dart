import 'package:expense_tracker/features/home/domain/repositories/i_expense_repo.dart';

class DeleteExpenseUseCase {
  final IExpenseRepo repo;

  DeleteExpenseUseCase({required this.repo});

  Future<void> deleteExpense({required String docId}) async {
    return repo.deleteExpense(docId: docId);
  }
}
