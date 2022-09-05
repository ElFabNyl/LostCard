import 'package:firebase_auth/firebase_auth.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lostcard/services/facebook_authentication/facebook_signin_auth.dart';
import 'package:lostcard/services/google_authentication/google_signin_auth.dart';
import 'package:lostcard/services/signin/login_auth.dart';
import 'package:lostcard/utils/validate_password.dart';
import 'package:lostcard/view/authentication/forget_password/forgot_password.dart';
import 'package:lostcard/view/authentication/signup/signup.dart';
import 'package:flutter/material.dart';
import 'package:lostcard/view/home_page/home_page.dart';
import 'package:lostcard/view/reusable_widgets/custom_snack_bar.dart';
import 'package:lostcard/view/reusable_widgets/customized_text_field.dart';
import 'package:lostcard/view/reusable_widgets/customized_text_button.dart';
import 'package:lostcard/view/reusable_widgets/loading_indicator.dart';
import '../../../constant/custom_color.dart';
import '../../../utils/validate_email_address.dart';
import '../../nav_bar_pages_manager/bottom_nav_bar_pages_manager.dart';
import '../../reusable_widgets/customized_text_button_icon.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  SignInState createState() => SignInState();
}

class SignInState extends State<SignIn> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  var emailErrorText;

  var passwordErrorText;

  var isEmail ;

  var doesPasswordContainsSpecialCharater;

  bool isEmailEmpty = true;
  bool isPasswordEmpty = true;

  final FirebaseAuth auth = FirebaseAuth.instance;

  var emailText = '';
  var passwordText = '';

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  String? get _errorText {
    // at any time, we can get the text from _controller.value.text
    isEmail = ValidateEmailAddress()
        .isEmailValid(emailController.value.text);

    doesPasswordContainsSpecialCharater = ValidatePassword()
        .isStrongPassword(passwordController.value.text);

    emailText = emailController.value.text;
    passwordText = passwordController.value.text;
    // Note: you can do your own custom validation here
    // Move this logic this outside the widget for more testable code
    if (emailText.isEmpty && passwordText.isEmpty) {
      emailErrorText = "Can't be empty";
      passwordErrorText = "Can't be empty";
      return emailErrorText;
    }
    if (emailText.isEmpty ) {
      emailErrorText = "Can't be empty";
      return emailErrorText;
    }

    if (passwordText.isEmpty) {
      passwordErrorText = "Can't be empty";
      return passwordErrorText;
    }
    if (passwordText.length <= 7) {
      passwordErrorText = "Too short, enter at least 8 characters";
      return emailErrorText;
    }

    if (isEmail==false) {
      print('jhhhhhhhhhhhhhhh'+ValidateEmailAddress()
          .isEmailValid(emailController.value.text) .toString());
      emailErrorText = 'Email address invalid, Please enter a valid email address!';
      return emailErrorText;
    }

    if(doesPasswordContainsSpecialCharater==false){
      passwordErrorText = 'Include 1 or more special character! Ex:@, #, ",*,&...';

    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
        margin: const EdgeInsets.fromLTRB(20, 20, 20, 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 40,
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Image(
                  image: AssetImage('assets/images/small_logo.png'),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Text(
                "Sign in",
                style: TextStyle(
                  fontSize: 40,
                  //fontFamily:'Roboto',
                  fontWeight: FontWeight.bold,
                  color: CustomColor.primaryColor,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 30,
              ),
              Align(
                child: CustomizedTextField(
                  controller: emailController,
                  labelText: 'Email address',
                  prefixIcon: Icon(FontAwesomeIcons.solidUser,
                      color: CustomColor.primaryColor, size: 15),
                  suffixIcon: const Icon(null),
                  suffixIconBeforeTap: const Icon(null),
                  suffixIconOnTap: const Icon(null),
                  isStringInputType: true,
                  isPassword: false,
                  width: 350,
                  height: 52,
                  errorText: isEmailEmpty ? emailErrorText : null,
                  onChanged: (_) {

                    if( emailController.value.text.isEmpty){
                      isEmailEmpty = true;
                      emailErrorText = "Can't be empty";
                    }
                    else
                      {
                        isEmailEmpty = false;
                      }




                    setState(() {});
                  },
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Align(
                child: CustomizedTextField(
                  controller: passwordController,
                  labelText: 'Password',
                  prefixIcon: Icon(FontAwesomeIcons.key,
                      color: CustomColor.primaryColor, size: 15),
                  suffixIcon: const Icon(null),
                  suffixIconBeforeTap: Icon(FontAwesomeIcons.eyeLowVision,
                      color: CustomColor.primaryColor, size: 15),
                  suffixIconOnTap: Icon(FontAwesomeIcons.solidEye,
                      color: CustomColor.primaryColor, size: 15),
                  isStringInputType: true,
                  isPassword: true,
                  width: 350,
                  height: 52,
                  errorText: (isPasswordEmpty || passwordText.length <= 7||doesPasswordContainsSpecialCharater==false)
                      ? passwordErrorText
                      : null,
                  onChanged: (value) {
                    passwordController.value.text.isEmpty
                        ? isPasswordEmpty = true
                        : isPasswordEmpty = false;
                    passwordText = value;
                    _errorText;

                    setState(() {});
                  },
                ),
              ),
              SizedBox(
                width: 340,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: CustomizedTextButton(
                    text: 'Forgot password',
                    buttonWidth: 150,
                    buttonHeight: 40,
                    border: 'noBorder',
                    textColor: CustomColor.primaryColor,
                    textFontSize: 16,
                    backgroundColor: CustomColor.primaryColor,
                    textAlignment: TextAlign.end,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ForgotPassword()),
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              CustomizedTextButton(
                text: 'LOGIN',
                buttonWidth: 129,
                buttonHeight: 43,
                border: 'border',
                textColor: Colors.white,
                textFontSize: 18,
                backgroundColor: CustomColor.primaryColor,
                onPressed: () async {
                  if (emailController.value.text.isNotEmpty &&
                      passwordController.value.text.isNotEmpty &&
                      passwordController.value.text.length > 7) {
                    if (ValidateEmailAddress()
                        .isEmailValid(emailController.value.text)) {
                      if (ValidatePassword()
                          .isStrongPassword(passwordController.value.text)) {
                        LoadingIndicator(this.context).startLoading();

                        try {
                          final newUser = await LoginAuth(FirebaseAuth.instance)
                              .signIn(
                                  email: emailController.value.text,
                                  password: passwordController.value.text,
                                  context: context);

                          if (newUser != null) {
                            LoadingIndicator(this.context).stopLoading();

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                       NavBarPagesManager(
                                          selectedIndex: 0)),
                            );
                          }
                        } on FirebaseAuthException catch (e) {
                          LoadingIndicator(this.context).stopLoading();

                          CustomSnackBar().showCustomSnackBar(context,
                              'This account does not exist in our system, Sign up first');
                        }
                      } else {
                        CustomSnackBar().showCustomSnackBar(context,
                            'Your password is not strong enough, include at least 1 special character! Ex:@, #, ",*,&...');
                      }
                    } else {
                      isEmailEmpty = true;
                      _errorText;
                      setState(() {});

                    }
                  } else {
                    null;
                    isEmailEmpty = true;
                    _errorText;
                    setState(() {});
                  }
                },
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: const [
                  Expanded(
                    child: Divider(
                      height: 20,
                      //color: Colors.grey,
                      thickness: 1,
                    ),
                  ),
                  Text(
                    " Or  ",
                    style: TextStyle(
                      fontSize: 16,
                      //fontFamily:'Roboto',
                      fontWeight: FontWeight.normal,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Expanded(
                    child: Divider(
                      height: 20,
                      //color: Colors.grey,
                      thickness: 1,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              CustomisedTextButtonIcon(
                buttonIcon: const Icon(
                  FontAwesomeIcons.google,
                  color: Colors.white,
                ),
                labelText: const Text('Connect with Google',
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.white,
                    )),
                backgroundColor: const Color(0x50296803),
                width: 340,
                height: 55,
                onPressed: () async {
                  try {
                    await GoogleSignInAuth(FirebaseAuth.instance)
                        .googleSignIn()
                        .then((_) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomePage()),
                      );
                    });
                  } on FirebaseAuthException catch (e) {
                    print(e);
                  }
                },
              ),
              const SizedBox(
                height: 20,
              ),
              CustomisedTextButtonIcon(
                buttonIcon: const Icon(
                  FontAwesomeIcons.facebook,
                  color: Colors.white,
                ),
                labelText: const Text('Connect with Facebook',
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.white,
                    )),
                backgroundColor: const Color(0xFF4267B2),
                width: 340,
                height: 55,
                onPressed: () async {
                  try {
                    final newUser =
                        await FacebookSignInAuth(FirebaseAuth.instance)
                            .signInWithFacebook();

                    if (newUser != null) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomePage()),
                      );
                    }
                  } on FirebaseAuthException catch (e) {
                    print(e);
                  }
                },
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                //Center Row contents horizontally,
                crossAxisAlignment: CrossAxisAlignment.center,
                //Center Row contents vertically,

                children: [
                  const Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Don't have an account yet?",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: CustomizedTextButton(
                      text: 'Sign up',
                      buttonWidth: 100,
                      buttonHeight: 40,
                      border: 'noBorder',
                      backgroundColor: CustomColor.primaryColor,
                      textColor: CustomColor.primaryColor,
                      textFontSize: 14,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignUp()),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
