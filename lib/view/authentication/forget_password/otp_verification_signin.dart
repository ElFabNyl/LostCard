import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lostcard/view/authentication/forget_password/new_password.dart';
import 'package:lostcard/view/authentication/signin/signin.dart';

import '../../../constant/custom_color.dart';
import '../../reusable_widgets/customized_text_button.dart';
import '../../reusable_widgets/customized_text_field.dart';

class OtpVerificationSignin extends StatefulWidget {
  const OtpVerificationSignin({Key? key}) : super(key: key);

  @override
  OtpVerificationSigninState createState() => OtpVerificationSigninState();
}

class OtpVerificationSigninState extends State<OtpVerificationSignin> {
  TextEditingController enterCodeController = TextEditingController();

  int endTime = DateTime.now().millisecondsSinceEpoch + 1000 * 120;

  bool visible = false;

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
                alignment: Alignment.centerLeft,
                child: SizedBox(
                  child: CustomizedTextField(
                    controller: enterCodeController,
                    labelText: 'Enter Code',
                    prefixIcon: Icon(FontAwesomeIcons.lock,
                        color: CustomColor().IconsColor, size: 15),
                    suffixIcon: const Icon(null),
                    suffixIconBeforeTap: const Icon(null),
                    suffixIconOnTap: const Icon(null),
                    isStringInputType: false,
                    isPassword: false,
                    width: 350,
                    height: 52,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              CountdownTimer(
                endTime: endTime,
                onEnd: () {
                  setState(() {
                    visible = true;
                  });
                },
              ),
              Visibility(
                visible: visible,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  //Center Row contents horizontally,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  //Center Row contents vertically,

                  children: [
                    const Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Didn't receive OTP?",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: CustomizedTextButton(
                        text: 'Resend',
                        buttonWidth: 100,
                        buttonHeight: 40,
                        border: 'noBorder',
                        textColor: const Color(0xFF133E04),
                        textFontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 70,
              ),
              CustomizedTextButton(
                text: 'VERIFY',
                buttonWidth: 129,
                buttonHeight: 43,
                border: 'border',
                textColor: Colors.white,
                textFontSize: 18,
              ),
            ],
          ),
        ),
      ),
    ));

    throw UnimplementedError();
  }
}
