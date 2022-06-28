import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lostcard/view/authentication/signin/forgot_password.dart';
import 'package:lostcard/view/authentication/signup/signup.dart';
import 'package:flutter/material.dart';
import 'package:lostcard/view/reusable_widgets/customized_text_field.dart';
import 'package:lostcard/view/reusable_widgets/customized_text_button.dart';
import 'package:lostcard/view/onboarding_screens/onboarding_page_registering_signaling.dart';

class Signin extends StatelessWidget {
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
                "Sign in",
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
              preffixIcon: const Icon(
                FontAwesomeIcons.key,
                color: Color(0xFF023607),
              ),
              suffixIcon: const Icon(null),
            )),
            const SizedBox(
              height: 20,
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: SizedBox(
                child: CustomizedTextButton(
                  text: 'Forgot password?',
                  widget: ForgotPassword(),
                  buttonWidth: 200,
                  buttonHeight: 40,
                  borderType: 'noBorder',
                  textColor: const Color(0xFF444444),
                  textFontSize: 12,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            CustomizedTextButton(
              text: 'LOGIN Not Completed',
              widget: OnboardingPageRegisteringSignaling(),
              buttonWidth: 340,
              buttonHeight: 55,
              borderType: 'border',
              textColor: Colors.white,
              textFontSize: 18,
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Or",
              style: TextStyle(
                fontSize: 16,
                //fontFamily:'Roboto',
                fontWeight: FontWeight.normal,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              child: SizedBox(
                width: 340,
                height: 55,
                child: TextButton(
                  child: const Text(
                    'Connect with Google Not Completed',
                    style: TextStyle(fontSize: 16.0, color: Color(0xFF003363)),
                  ),
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        const Color(0x30296803),
                      ),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          //side: BorderSide(color: Colors.black,)
                        ),
                      )),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              OnboardingPageRegisteringSignaling()),
                    );
                  },
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Align(
              alignment: Alignment.center,
              child: SizedBox(
                  //margin:EdgeInsets.fromLTRB(20, 0, 0, 20),
                  //width: 236,
                  //height: 27,
                  //margin: EdgeInsets.fromLTRB(40, 20, 40, 0),

                  child: Align(
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  //Center Row contents horizontally,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  //Center Row contents vertically,

                  children: [
                    const Align(
                      alignment: Alignment.center,
                      child: SizedBox(
                        // margin: EdgeInsets.all(20),

                        child: Text(
                          "Don't have an account yet?",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: SizedBox(
                        child: CustomizedTextButton(
                          text: 'Sign up',
                          widget: Signup(),
                          buttonWidth: 100,
                          buttonHeight: 40,
                          borderType: 'noBorder',
                          textColor: const Color(0xFF133E04),
                          textFontSize: 14,
                        ),
                      ),
                    ),
                  ],
                ),
              )),
            ),
          ],
        ),
      ),
    ));
    throw UnimplementedError();
  }
}
