import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInAuth  {
  GoogleSignIn googleAuth = GoogleSignIn();
  GoogleSignInAccount? googleAccount;
  final FirebaseAuth auth;

  GoogleSignInAuth(this.auth);

  Future<void> googleSignIn() async {
    googleAccount = await googleAuth.signIn();


    if (googleAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleAccount!.authentication;
      final AuthCredential authCredential = GoogleAuthProvider.credential(
          idToken: googleSignInAuthentication.idToken,
          accessToken: googleSignInAuthentication.accessToken);

       await auth.signInWithCredential(authCredential);

    }
  }

  googleSignOut() async {
    googleAccount = await googleAuth.signOut();

  }
}
