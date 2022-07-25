import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lostcard/view/authentication/forget_password/new_password.dart';
import 'package:lostcard/view/authentication/forget_password/otp_verification_signin.dart';
import 'package:lostcard/view/authentication/signin/signin.dart';

import '../../../constant/custom_color.dart';
import '../../reusable_widgets/customized_text_button.dart';
import '../../reusable_widgets/customized_text_field.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  ForgotPasswordState createState() => ForgotPasswordState();
}

class ForgotPasswordState extends State<ForgotPassword> {
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
        margin: const EdgeInsets.fromLTRB(20, 20, 20, 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Align(
                alignment: Alignment.center,
                child: SizedBox(
                  width: 264,
                  child: Text(
                    'Forgot Password',
                    style: TextStyle(
                      fontSize: 20,
                      //fontFamily:'Roboto',
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF023607),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              const SizedBox(
                height: 120,
              ),
              const Align(
                alignment: Alignment.center,
                child: Text(
                  'Enter Email Address',
                  style: TextStyle(
                    fontSize: 20,
                    //fontFamily:'Roboto',
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(
                height: 20,
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
                ),
              ),
              const SizedBox(
                height: 70,
              ),
              CustomizedTextButton(
                text: 'SEND',
                buttonWidth: 129,
                buttonHeight: 43,
                border: 'border',
                textColor: Colors.white,
                textFontSize: 18,
                  backgroundColor: CustomColor().IconsColor,
                onPressed: (){

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const NewPassword()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    ));
    throw UnimplementedError();
  }
}
