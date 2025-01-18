abstract class ISignInRepo {
  Future signInWithEmailAndPassword({required String email, required String password});
}
