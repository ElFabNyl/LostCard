import 'package:firebase_auth/firebase_auth.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lostcard/view/authentication/signup/otp_verification_signup.dart';
import 'package:lostcard/view/authentication/signup/register_last_step.dart';
import 'package:lostcard/view/reusable_widgets/customized_text_field.dart';
import 'package:lostcard/view/reusable_widgets/customized_text_button.dart';
import 'package:lostcard/view/authentication/signin/signin.dart';
import 'package:flutter/material.dart';

import '../../../constant/custom_color.dart';
import '../../../services/signup/signup_auth.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  SignupState createState() => SignupState();
}






class SignupState extends State<Signup> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  var errorText;

  bool isEmailEmpty = true;
  bool isPasswordEmpty = true;
  var emailText ='';
  var  passwordText='' ;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }


  String? get _errorText {
    // at any time, we can get the text from _controller.value.text
    final emailText = emailController.value.text;
    final passwordText = passwordController.value.text;
    // Note: you can do your own custom validation here
    // Move this logic this outside the widget for more testable code
    if (emailText.isEmpty) {
      errorText = "Can't be empty";
      return errorText;
    } else {
      if (passwordText.isEmpty) {
        errorText = "Can't be empty";
        return errorText;
      } else if (passwordText.length <= 4) {
        errorText = "Too short, enter at least five characters";
        return errorText;
      }
    }

    // return null if the text is valid
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
                const Text(
                  "Sign up",
                  style: TextStyle(
                    fontSize: 40,
                    //fontFamily:'Roboto',
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF023607),
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
                        color: CustomColor().IconsColor, size: 15),
                    suffixIcon: const Icon(null),
                    suffixIconBeforeTap: const Icon(null),
                    suffixIconOnTap: const Icon(null),
                    isStringInputType: true,
                    isPassword: false,
                    width: 350,
                    height: 52,
                    errorText:
                    isEmailEmpty ? errorText : null,
                    onChanged:  (value){

                      print(emailText);

                      emailController.value.text.isEmpty? isEmailEmpty = true : isEmailEmpty = false ;

                      setState(() {
                        emailText = value;


                      });



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
                        color: CustomColor().IconsColor, size: 15),
                    suffixIcon: const Icon(null),
                    suffixIconBeforeTap: Icon(FontAwesomeIcons.eyeLowVision,
                        color: CustomColor().IconsColor, size: 15),
                    suffixIconOnTap: Icon(FontAwesomeIcons.solidEye,
                        color: CustomColor().IconsColor, size: 15),
                    isStringInputType: true,
                    isPassword: true,
                    width: 350,
                    height: 52,
                    errorText:
                    (isPasswordEmpty||passwordText.length<=4 )? errorText : null,
                    onChanged:  (value){
                      passwordController.value.text.isEmpty? isPasswordEmpty = true : isPasswordEmpty = false ;

                      _errorText;
                      print(passwordText);

                      setState(() {
                        passwordText = value;


                      });



                    },
                  ),
                ),
                const SizedBox(
                  height: 41,
                ),
                CustomizedTextButton(
                  text: 'Continue',
                  buttonWidth: 129,
                  buttonHeight: 43,
                  border: 'border',
                  textColor: Colors.white,
                  textFontSize: 18,
                    backgroundColor: CustomColor().IconsColor,
                  onPressed: () async {
                    if (emailController.value.text.isNotEmpty &&
                        passwordController.value.text.isNotEmpty &&
                        passwordController.value.text.length > 4) {
                      //print(emailController.value.text);
                      //print(passwordController.value.text);

                      try {
                        print("Nathalie");

                        Null result = null;



                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>   RegisterLastStep(email: emailText, password: passwordText,  )),
                          );


                      } on FirebaseAuthException catch (e) {
                        print(e);
                      }
                    } else {
                      null;
                      _errorText;
                      setState(() {

                      });


                    }
                    ;
                  },
                ),
                const SizedBox(
                  height: 166,
                ),
                Align(
                    alignment: Alignment.center,

                    //margin:EdgeInsets.fromLTRB(20, 0, 0, 20),
                    //width: 236,
                    //height: 27,
                    //margin: EdgeInsets.fromLTRB(90, 20, 90, 0),

                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      //Center Row contents horizontally,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      //Center Row contents vertically,

                      children: [
                        CustomizedTextButton(
                          text: 'SignIn',
                          buttonWidth: 70,
                          buttonHeight: 39,
                          border: 'noBorder',
                          textColor: const Color(0xFF012405),
                          textFontSize: 16,
                            backgroundColor: CustomColor().IconsColor,
                        ),
                        const Align(
                          alignment: Alignment.centerRight,
                          child: SizedBox(
                            // margin: EdgeInsets.all(20),

                            child: Text(
                              "instead",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ),
                      ],
                    )),
              ],
            ),
          )),
    ));
    throw UnimplementedError();
  }
}
