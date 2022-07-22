import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lostcard/services/signup/phone_otp_verification.dart';
import 'package:lostcard/view/authentication/signup/otp_verification_signup.dart';
import 'package:lostcard/view/reusable_widgets/customized_text_field.dart';
import 'package:lostcard/view/reusable_widgets/customized_text_button.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../reusable_widgets/loading_indicator.dart';

class RegisterLastStep extends StatefulWidget {
  final String email;
  final String password;

  const RegisterLastStep( {Key? key,
  required this.email,
  required this.password,}) : super(key: key);

  @override
  RegisterLastStepState createState() => RegisterLastStepState(email: email, password: password);
}

class RegisterLastStepState extends State<RegisterLastStep>{
  final String email;
  final String password;


  RegisterLastStepState({required this.email, required this.password});

  TextEditingController enterNameController = TextEditingController();
  TextEditingController enterPhoneNumberController = TextEditingController();

  final FirebaseAuth auth = FirebaseAuth.instance;
  var verificationCode ='' ;

  Future verifyPhone(String phoneNumber) async {


    await auth.verifyPhoneNumber(
      phoneNumber: '+237' + phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) async {
      },
      verificationFailed: (FirebaseAuthException e) async {
        print (e.message);
      },
      codeSent: (String verificationId, int? resendToken)async {

         setState(() {
           this.verificationCode =  verificationId;
        });


        print( 'This is  the the the the the the the the the the another'+verificationCode+'hhhhhhhhhhhhhhh');

         if(verificationCode!=null)
         {

           LoadingIndicator(this.context).stopLoading();


           Navigator.push(
             context,
             MaterialPageRoute(
                 builder: (context) =>  OtpVerificationSignup(verificationId: verificationCode, email: email,password: password,)),

           );
         }




      },

      codeAutoRetrievalTimeout: (String verificationId) { },

      timeout: Duration(seconds: 60),

    );



  }




  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
          margin: const EdgeInsets.fromLTRB(20, 60, 20, 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Align(
                  alignment: Alignment.centerLeft,
                  child: SizedBox(
                    width: 99,
                    height: 37,
                    child: Image(
                      image: AssetImage('assets/images/small_logo.png'),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                const SizedBox(
                  width: 225,
                  height: 47,
                  child: Text(
                    "Sign up",
                    style: TextStyle(
                      fontSize: 40,
                      //fontFamily:'Roboto',
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF023607),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                SizedBox(
                    width: 350,
                    height: 55,
                    child: Row(
                      //crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            width: 106,
                            height: 52,
                            alignment: Alignment.centerLeft,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Color(0xFFB1B1B1),
                              ),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              //Center Row contents horizontally,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              //Center Row contents vertically,

                              children: const [
                                SizedBox(
                                  height: 18,
                                  width: 20,
                                  child: Center(
                                    child: Image(
                                      image:
                                          AssetImage('assets/images/flag.png'),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "+237",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.black,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            )),
                        CustomizedTextField(
                          controller: enterPhoneNumberController,
                          labelText: 'Enter Phone Number',
                          prefixIcon: const Icon(FontAwesomeIcons.phone,
                              color: Color(0xFF023607), size: 15),
                          suffixIcon: const Icon(null),
                          suffixIconBeforeTap: const Icon(null),
                          suffixIconOnTap: const Icon(null),
                          isStringInputType: false,
                          isPassword: false,
                          width: 230,
                          height: 52,
                        ),
                      ],
                    )),
                const SizedBox(
                  height: 46,
                ),
                CustomizedTextField(
                  controller: enterNameController,
                  labelText: 'Enter Name',
                  prefixIcon: const Icon(FontAwesomeIcons.solidUser,
                      color: Color(0xFF023607), size: 15),
                  suffixIcon: const Icon(null),
                  suffixIconBeforeTap: const Icon(null),
                  suffixIconOnTap: const Icon(null),
                  isStringInputType: true,
                  isPassword: false,
                  width: 350,
                  height: 52,
                ),
                const SizedBox(
                  height: 86,
                ),
                SizedBox(
                  child: CustomizedTextButton(
                    text: 'CONTINUE',
                    buttonWidth: 129,
                    buttonHeight: 43,
                    border: 'border',
                    textColor: Colors.white,
                    textFontSize: 18,
                    onPressed: ()  async {

                      LoadingIndicator(this.context).startLoading();


                        await verifyPhone(enterPhoneNumberController.value.text);
                         //print('Realllllllllllllllllllllly'+code);



                      // if(code!=null)
                      //  {
                      //
                      //
                      //    Navigator.push(
                      //      context,
                      //      MaterialPageRoute(
                      //          builder: (context) =>  OtpVerificationSignup(verificationId: code, email: email,password: password,)),
                      //
                      //    );
                      //  }


                      print(this.email);
                      print(this.password);

                    },
                  ),
                ),
              ],
            ),
          )),
    ));
    throw UnimplementedError();
  }
}
