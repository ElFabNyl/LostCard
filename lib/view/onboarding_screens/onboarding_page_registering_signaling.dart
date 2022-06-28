import 'package:flutter/material.dart';
import 'package:lostcard/view/onboarding_screens/onboarding_page_reward.dart';
import '../reusable_widgets/customized_text_button.dart';

class OnboardingPageRegisteringSignaling extends StatelessWidget {
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
            const Align(
              alignment: Alignment.bottomRight,
              child: SizedBox(
                child: Text(
                  "Skip",
                  style: TextStyle(
                    fontSize: 15,
                    color: Color(0xFF868686),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 140,
            ),
            const SizedBox(
              child: Text(
                "Register or signal a document  you have just lost or found",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const SizedBox(
              child: Text(
                "Wherever you are ,notify  or register a lost or found document in simple steps",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF868686),
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            const Align(
              alignment: Alignment.bottomRight,
              child: SizedBox(
                child: Image(
                  image:
                      AssetImage('assets/images/image_onboarding_screen1.png'),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            CustomizedTextButton(
              text: 'Next',
              widget: OnboardingPageReward(),
              buttonWidth: 132,
              buttonHeight: 39,
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
