import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lostcard/services/signup/signup_auth.dart';

import '../../view/authentication/signin/signin.dart';
import '../../view/reusable_widgets/loading_indicator.dart';

class PhoneOTPVerification {
  FirebaseAuth auth = FirebaseAuth.instance;
  String phoneNumber = '';

  String smsCode = '';

  String verificationId = '';


  PhoneOTPVerification(this.auth);


  Future<void> verifyOTP(String verificationId, String smsCode, String email, String password, BuildContext context) async {
    print('Verificationnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnn'+verificationId);
    print('Verificationnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnn'+smsCode);

    var credential = PhoneAuthProvider.credential(
        verificationId: verificationId, smsCode: smsCode);

    var user = await auth.signInWithCredential(credential);



    if (user != null) {
      SignupAuth(FirebaseAuth.instance).signup(
          email: email,
          password: password);

      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => const Signin()),

      );
    }
    else
      {


        print('OTP code not valid!');

        const snackBar = SnackBar(
          content: Text('OTP code not valid!'),
        );

        ScaffoldMessenger.of(context).showSnackBar(snackBar);

      }


    }


  }

