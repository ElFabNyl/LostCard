import 'package:firebase_auth/firebase_auth.dart';


  class LoginAuth{
  final FirebaseAuth auth ;

  LoginAuth(this.auth);


  Future<UserCredential?> signin({required String email, required String password}) async {
    print(email);
    print(password);

  try{
  var a = await auth.signInWithEmailAndPassword(email: email, password: password);
  print("Signed in");
  return a;
  } on FirebaseAuthException catch (e){
    print("An error occured");

  }
  }

  }


