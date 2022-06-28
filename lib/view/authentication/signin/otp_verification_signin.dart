import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lostcard/view/authentication/signin/forgot_password.dart';
import 'package:lostcard/view/authentication/signin/new_password.dart';
import 'package:lostcard/view/authentication/signin/signin.dart';

import '../../reusable_widgets/customized_text_button.dart';
import '../../reusable_widgets/customized_text_field.dart';

class OtpVerificationSignin extends StatelessWidget {
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
            Row(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: SizedBox(
                    child: IconButton(
                      icon: const Icon(FontAwesomeIcons.angleLeft),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ForgotPassword()),
                        );
                      },
                    ),
                  ),
                ),
                const Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                    width: 264,
                    child: Text(
                      'Verification',
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
              ],
            ),
            const SizedBox(
              height: 140,
            ),
            const Align(
              alignment: Alignment.center,
              child: Text(
                'Enter OTP verification code',
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
                labelText: 'Enter Code',
                preffixIcon: const Icon(null, color: Color(0xFF023607)),
                suffixIcon: const Icon(null),
              )),
            ),
            const SizedBox(
              height: 20,
            ),
            Align(
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                //Center Row contents horizontally,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Align(
                    alignment: Alignment.center,
                    child: SizedBox(
                      child: Text(
                        "Didn't receive OTP?",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                    child: Text(
                      "Countdown",
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xFF023607),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              child: CustomizedTextButton(
                text: 'Resend Not Completed',
                widget: Signin(),
                buttonWidth: 80,
                buttonHeight: 40,
                borderType: 'noBorder',
                textColor: Colors.red,
                textFontSize: 12,
              ),
            ),
            const SizedBox(
              height: 90,
            ),
            CustomizedTextButton(
              text: 'VERIFY',
              widget: NewPassword(),
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
