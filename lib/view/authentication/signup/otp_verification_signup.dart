import 'package:lostcard/view/authentication/signup/register_last_step.dart';
import 'package:lostcard/view/reusable_widgets/customized_text_button.dart';
import 'package:lostcard/view/reusable_widgets/customized_text_field.dart';
import 'package:flutter/material.dart';

class OtpVerificationSignup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
        margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: Column(
          children: [
            const SizedBox(
              height: 60,
            ),
            const Align(
              alignment: Alignment.centerLeft,
              child: SizedBox(
                child: Image(
                  image: AssetImage('assets/images/small_logo.png'),
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            const SizedBox(
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
              height: 20,
            ),
            const SizedBox(
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
            const SizedBox(
              height: 20,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: SizedBox(
                  child: CustomizedTextField(
                labelText: 'Enter code',
                preffixIcon: const Icon(null),
                suffixIcon: const Icon(null),
              )),
            ),
            const SizedBox(
              height: 83,
            ),
            CustomizedTextButton(
              text: 'Continue',
              widget: RegisterLastStep(),
              buttonWidth: 129,
              buttonHeight: 43,
              borderType: 'border',
              textColor: Colors.white,
              textFontSize: 18,
            ),
          ],
        ),
      ),
    ));
    throw UnimplementedError();
  }
}
