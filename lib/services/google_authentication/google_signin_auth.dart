import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSigninAuth  {
  GoogleSignIn googleAuth = GoogleSignIn();
  GoogleSignInAccount? googleAccount;
  final FirebaseAuth auth;

  GoogleSigninAuth(this.auth);

  Future<void> googleSignin() async {
    googleAccount = await googleAuth.signIn();


    if (googleAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleAccount!.authentication;
      final AuthCredential authCredential = GoogleAuthProvider.credential(
          idToken: googleSignInAuthentication.idToken,
          accessToken: googleSignInAuthentication.accessToken);

      // Getting users credential
      UserCredential result = await auth.signInWithCredential(authCredential);
      User? user = result.user;
    }
  }

  googleSignout() async {
    googleAccount = await googleAuth.signOut();

  }
}
