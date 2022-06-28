import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lostcard/view/authentication/signup/otp_verification_signup.dart';
import 'package:lostcard/view/reusable_widgets/customized_text_field.dart';
import 'package:lostcard/view/reusable_widgets/customized_text_button.dart';
import 'package:lostcard/view/authentication/signin/signin.dart';
import 'package:flutter/material.dart';

class Signup extends StatelessWidget {
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
              Align(
                child: SizedBox(
                    child: CustomizedTextField(
                  labelText: 'Email Address',
                  preffixIcon: const Icon(FontAwesomeIcons.solidUser,
                      color: Color(0xFF023607)),
                  suffixIcon: const Icon(null),
                )),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                  child: CustomizedTextField(
                labelText: 'Password',
                preffixIcon:
                    const Icon(FontAwesomeIcons.key, color: Color(0xFF023607)),
                suffixIcon: const Icon(null),
              )),
              const SizedBox(
                height: 41,
              ),
              CustomizedTextButton(
                text: 'Continue',
                widget: OtpVerificationSignup(),
                buttonWidth: 129,
                buttonHeight: 43,
                borderType: 'border',
                textColor: Colors.white,
                textFontSize: 18,
              ),
              const SizedBox(
                height: 216,
              ),
              Align(
                alignment: Alignment.center,
                child: SizedBox(
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
                      widget: Signin(),
                      buttonWidth: 70,
                      buttonHeight: 39,
                      borderType: 'noBorder',
                      textColor: const Color(0xFF012405),
                      textFontSize: 16,
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
              ),
            ],
          )),
    ));
    throw UnimplementedError();
  }
}
