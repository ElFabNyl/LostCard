import 'package:flutter/material.dart';
import 'package:lostcard/view/reusable_widgets/customized_text_field.dart';
import 'package:lostcard/view/reusable_widgets/customized_text_button.dart';
import 'package:lostcard/view/onboarding_screens/onboarding_page_registering_signaling.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RegisterLastStep extends StatelessWidget {
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
          margin: const EdgeInsets.fromLTRB(20, 60, 20, 0),
          child: Column(
            children: [
              const Align(
                alignment: Alignment.centerLeft,
                child: SizedBox(
                  width: 99,
                  height: 37,
                  child: Image(
                    image: AssetImage('assets/images/small_logo.png'),
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              const SizedBox(
                width: 225,
                height: 47,
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
              SizedBox(
                  width: 350,
                  height: 55,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                          width: 106,
                          height: 52,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Color(0xFFB1B1B1),
                            ),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            //Center Row contents horizontally,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            //Center Row contents vertically,

                            children: const [
                              Align(
                                child: SizedBox(
                                  height: 18,
                                  width: 20,
                                  child: Center(
                                    child: Image(
                                      image:
                                          AssetImage('assets/images/flag.png'),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 47,
                                height: 25,
                                child: Text(
                                  "+237",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.black,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          )),
                      const SizedBox(
                        width: 30,
                      ),
                      SizedBox(
                        width: 205,
                        height: 52,
                        child: TextField(
                          obscureText: true,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            labelText: 'Enter Phone Number',
                          ),
                        ),
                      ),
                    ],
                  )),
              const SizedBox(
                height: 46,
              ),
              SizedBox(
                  child: CustomizedTextField(
                labelText: 'Enter Your name',
                preffixIcon: const Icon(FontAwesomeIcons.solidUser,
                    color: Color(0xFF023607)),
                suffixIcon: const Icon(null),
              )),
              const SizedBox(
                height: 106,
              ),
              SizedBox(
                child: CustomizedTextButton(
                  text: 'SAVE Not Completed',
                  widget: OnboardingPageRegisteringSignaling(),
                  buttonWidth: 129,
                  buttonHeight: 43,
                  borderType: 'border',
                  textColor: Colors.white,
                  textFontSize: 18,
                ),
              ),
            ],
          )),
    ));
    throw UnimplementedError();
  }
}
