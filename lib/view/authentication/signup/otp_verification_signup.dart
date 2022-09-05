import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_countdown_timer/index.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lostcard/constant/custom_color.dart';
import 'package:lostcard/services/signup/phone_otp_verification.dart';
import 'package:lostcard/utils/validate_number.dart';
import 'package:lostcard/view/reusable_widgets/customized_text_button.dart';
import 'package:lostcard/view/reusable_widgets/customized_text_field.dart';
import 'package:flutter/material.dart';

import '../../../controllers/user_controller.dart';
import '../../../model/user.dart';
import '../../reusable_widgets/custom_snack_bar.dart';
import '../../reusable_widgets/loading_indicator.dart';

class OtpVerificationSignup extends StatefulWidget {
  String? verificationId;
  final String email;
  final String password;
  final String phoneNumber;
  final String name;

  OtpVerificationSignup(
      {this.verificationId,
      required this.email,
      required this.password,
      required this.phoneNumber,
      required this.name,
      Key? key})
      : super(key: key);

  @override
  OtpVerificationSignupState createState() => OtpVerificationSignupState();
}

class OtpVerificationSignupState extends State<OtpVerificationSignup> {
  TextEditingController enterCodeController = TextEditingController();

  int endTime = DateTime.now().millisecondsSinceEpoch + 1000 * 60;

  CountdownTimerController timerController = CountdownTimerController(
      endTime: DateTime.now().millisecondsSinceEpoch + 1000 * 120);

  bool visible = false;

  bool isCodeEmpty = false;

  @override
  void dispose() {
    if (mounted) {
      setState(() {
        timerController.dispose();
      });
    }

    super.dispose();
  }

  String? setData(String verificationCode) {
    setState(() {
      widget.verificationId = verificationCode;
    });

    return widget.verificationId;
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
                "Sign up",
                style: TextStyle(
                  fontSize: 40,
                  //fontFamily:'Roboto',
                  fontWeight: FontWeight.bold,
                  color: CustomColor.primaryColor,
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
                        color: CustomColor.primaryColor, size: 15),
                    suffixIcon: const Icon(null),
                    suffixIconBeforeTap: const Icon(null),
                    suffixIconOnTap: const Icon(null),
                    isStringInputType: false,
                    isPassword: false,
                    width: 350,
                    height: 52,
                    errorText: isCodeEmpty ? "Can't be empty" : null,
                    onChanged: (_) {
                      enterCodeController.value.text.isEmpty
                          ? isCodeEmpty = true
                          : isCodeEmpty = false;

                      setState(() {});
                    },
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
                        backgroundColor: CustomColor.primaryColor,
                        onPressed: () async {
                          LoadingIndicator(this.context).startLoading();

                          await PhoneOTPVerification(FirebaseAuth.instance)
                              .verifyPhone(widget.phoneNumber, setData, context,
                                  widget.email, widget.password, widget.name);
                        },
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
                backgroundColor: CustomColor.primaryColor,
                onPressed: () async {
                  if (enterCodeController.value.text.isNotEmpty) {
                    if (ValidateNumber()
                        .isNumber(enterCodeController.value.text)) {
                      LoadingIndicator(this.context).startLoading();
                      await PhoneOTPVerification(FirebaseAuth.instance)
                          .verifyOTP(
                        widget.verificationId,
                        enterCodeController.value.text,
                        widget.email,
                        widget.password,
                        this.context,
                      );

                      final user = UserModel(
                          idUser: FirebaseAuth.instance.currentUser!.uid,
                          name: widget.name,
                          emailAddress: widget.email,
                          password: widget.password,
                          phoneNumber: widget.phoneNumber,
                          profilePicture: '',
                          documentsFound: '0',
                          rewardsGained: '0'

                      );


                      await UserController().addUser(user);
                    } else {
                      CustomSnackBar().showCustomSnackBar(
                          context, 'OTP code does not contain characters');
                    }
                  } else {
                    CustomSnackBar().showCustomSnackBar(
                        context, 'Code cannot be empty, please enter a value');
                    setState(() {});
                  }
                },
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
