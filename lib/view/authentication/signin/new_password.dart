import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../reusable_widgets/customized_text_button.dart';
import '../../reusable_widgets/customized_text_field.dart';
import 'otp_verification_signin.dart';

class NewPassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
        margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            const SizedBox(
              width: 264,
              child: Text(
                'New Password',
                style: TextStyle(
                  fontSize: 20,
                  //fontFamily:'Roboto',
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF023607),
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 140,
            ),
            const Align(
              alignment: Alignment.center,
              child: Text(
                'Enter new password',
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
              child: SizedBox(
                  child: CustomizedTextField(
                labelText: '***********************',
                preffixIcon:
                    const Icon(FontAwesomeIcons.key, color: Color(0xFF023607)),
                suffixIcon: const Icon(FontAwesomeIcons.eyeLowVision,
                    color: Color(0xFF023607)),
              )),
            ),
            const SizedBox(
              height: 110,
            ),
            CustomizedTextButton(
              text: 'SUBMIT Not Completed',
              widget: OtpVerificationSignin(),
              buttonWidth: 340,
              buttonHeight: 55,
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
