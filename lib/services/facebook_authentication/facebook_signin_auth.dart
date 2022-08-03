import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:lostcard/services/facebook_authentication/resource.dart';

class FacebookSignInAuth {
  final FirebaseAuth auth;

  FacebookSignInAuth(this.auth);

  Future<Resource?> signInWithFacebook() async {
    try {
      final LoginResult result = await FacebookAuth.instance.login();
      switch (result.status) {
        case LoginStatus.success:
          final AuthCredential facebookCredential =
              FacebookAuthProvider.credential(result.accessToken!.token);
          await auth.signInWithCredential(facebookCredential);
          return Resource(status: Status.success);
        case LoginStatus.cancelled:
          return Resource(status: Status.cancelled);
        case LoginStatus.failed:
          return Resource(status: Status.error);
        default:
          return null;
      }
    } on FirebaseAuthException {
      rethrow;
    }
  }
}
