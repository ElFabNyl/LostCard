import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lostcard/view/reusable_widgets/loading_indicator.dart';

import '../../view/reusable_widgets/custom_snack_bar.dart';

class LoginAuth {
  final FirebaseAuth auth;

  LoginAuth(this.auth);

  Future<UserCredential?> signIn(
      {required String email,
      required String password,
      required BuildContext context}) async {
    try {
      var a = await auth.signInWithEmailAndPassword(
          email: email, password: password);

      return a;
    } on FirebaseAuthException catch (e) {
      LoadingIndicator(context).stopLoading();

      CustomSnackBar().showCustomSnackBar(context,
          'You are not connected to the internet, Check your internet connection');
    }
    return null;
  }
}
