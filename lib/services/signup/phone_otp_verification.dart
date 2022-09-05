import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lostcard/constant/custom_color.dart';
import 'package:lostcard/services/signup/signup_auth.dart';
import 'package:lostcard/view/nav_bar_pages_manager/bottom_nav_bar_pages_manager.dart';

import '../../view/authentication/signup/otp_verification_signup.dart';
import '../../view/reusable_widgets/custom_snack_bar.dart';
import '../../view/reusable_widgets/loading_indicator.dart';

class PhoneOTPVerification {
  FirebaseAuth auth = FirebaseAuth.instance;
  String phoneNumber = '';

  String smsCode = '';

  String verificationId = '';

  bool isNotUser = true;

  PhoneOTPVerification(this.auth);

  Future verifyPhone(String phoneNumber, Function setData, BuildContext context,
      String email, String password, String name) async {
    await auth.verifyPhoneNumber(
      phoneNumber: '+237' + phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) async {},
      verificationFailed: (FirebaseAuthException e) async {
        LoadingIndicator(context).stopLoading();

        CustomSnackBar().showCustomSnackBar(
            context, 'operation failed, Internet connection unavailable!');
      },
      codeSent: (String verificationId, int? resendToken) async {
        String verificationCode = setData(verificationId);

        LoadingIndicator(context).stopLoading();

        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => OtpVerificationSignup(
                    verificationId: verificationCode,
                    email: email,
                    password: password,
                    phoneNumber: phoneNumber,
                    name: name,
                  )),
        );
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
      timeout: const Duration(seconds: 60),
    );
  }

  Future<void> verifyOTP(
      String? verificationId,
      String smsCode,
      String email,
      String password,
      BuildContext context,) async {
    String a = verificationId!;

    try {
      var credential =
          PhoneAuthProvider.credential(verificationId: a, smsCode: smsCode);

      await auth.signInWithCredential(credential);
      await auth.signOut();

      await SignupAuth(FirebaseAuth.instance)
          .signup(email: email, password: password);

      isNotUser = false;

      LoadingIndicator(context).stopLoading();

      var snackBar = SnackBar(
        content: const Text('you have signed up Successfully'),
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.only(bottom: MediaQuery.of(context).size.height/3),
        backgroundColor: CustomColor.primaryColor,
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      //
      // CustomSnackBar()
      //     .showCustomSnackBar(context, 'you have signed up Successfully',);

      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => NavBarPagesManager(selectedIndex: 0)),
      );
    } on FirebaseAuthException catch (e) {
      LoadingIndicator(context).stopLoading();
      const snackBar = SnackBar(
        content: Text('Yay! A SnackBar!'),
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);

      CustomSnackBar().showCustomSnackBar(context, 'OTP code not valid!');
    }
  }
}
