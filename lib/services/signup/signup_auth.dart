import 'package:firebase_auth/firebase_auth.dart';

class SignupAuth {
  final FirebaseAuth auth;

  SignupAuth(this.auth);

  Future<String?> signup(
      {required String email, required String password}) async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
    return null;
  }
}
