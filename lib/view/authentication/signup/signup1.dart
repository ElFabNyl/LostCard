import 'package:lostcard/view/authentication/signup/signup1.dart';
import 'package:lostcard/view/reusable_widgets/customized_text_button.dart';
import 'package:lostcard/view/reusable_widgets/customized_text_field.dart';
import 'package:lostcard/view/onboarding_screens/onboarding_screen1.dart';
import 'package:flutter/material.dart';

class Signup1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
          child: Column(
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(20, 60, 20, 0),
            alignment: Alignment.centerLeft,
            child: const Image(
              image: AssetImage('assets/images/small_logo.png'),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(20, 50, 20, 0),
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
          Container(
            margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
            child: Text(
              "We have sent you a code in your mail box, please check it. ",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color(0xFF868686),
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Container(
              margin: EdgeInsets.fromLTRB(20, 20, 20, 83),
              alignment: Alignment.centerLeft,
              child: CustomizedTextField(
                labelText: 'Enter code',
                icon: Icon(null),
              )),
          Container(
            child: CustomizedTextButton(
              text: 'Continue',
              widget: OnboardingScreeen1(),
              buttonWidth: 129,
              buttonHeight: 43,
            ),
          ),
        ],
      )),
    ));
    throw UnimplementedError();
  }
}
