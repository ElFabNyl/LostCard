import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:flutter_countdown_timer/index.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lostcard/constant/custom_color.dart';
import 'package:lostcard/services/signup/phone_otp_verification.dart';
import 'package:lostcard/view/authentication/signup/register_last_step.dart';
import 'package:lostcard/view/reusable_widgets/customized_text_button.dart';
import 'package:lostcard/view/reusable_widgets/customized_text_field.dart';
import 'package:flutter/material.dart';

import '../../reusable_widgets/loading_indicator.dart';

class OtpVerificationSignup extends StatefulWidget {
  final String verificationId;
  final String email;
  final String password;

  const OtpVerificationSignup({
    required this.verificationId,
    required this.email,
    required this.password,
    Key? key
  }) : super(key: key);

  @override
  OtpVerificationSignupState createState() => OtpVerificationSignupState(verificationId:verificationId, email:email, password:password);
}

class OtpVerificationSignupState extends State<OtpVerificationSignup> {
  final String verificationId;
  final String email;
  final String password;

  OtpVerificationSignupState({
    required this.verificationId,
    required this.email,
    required this.password

});

  TextEditingController enterCodeController = TextEditingController();




  int endTime = DateTime.now().millisecondsSinceEpoch + 1000 * 120;

  //CountdownTimerController timerController = CountdownTimerController(endTime: DateTime.now().millisecondsSinceEpoch + 1000 * 120);

  bool visible = false;


  void dispose() {
    //timerController.dispose();

    super.dispose();
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
                height: 20,
              ),
              const SizedBox(
                child: Text(
                  "We have sent you a code through phone sms, please check it. ",
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
                //controller: timerController,
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
                onPressed: () async {

                  await PhoneOTPVerification(FirebaseAuth.instance).verifyOTP( verificationId, enterCodeController.value.text, email,password, this.context);
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
