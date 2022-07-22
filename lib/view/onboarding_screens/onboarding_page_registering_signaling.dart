import 'package:flutter/material.dart';
import 'package:lostcard/view/onboarding_screens/onboarding_page_reward.dart';
import '../reusable_widgets/customized_text_button.dart';

class OnboardingPageRegisteringSignaling extends StatelessWidget {
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
                alignment: Alignment.bottomRight,
                child: Text(
                  "Skip",
                  style: TextStyle(
                    fontSize: 15,
                    color: Color(0xFF868686),
                  ),
                ),
              ),
              const SizedBox(
                height: 140,
              ),
              const Text(
                "Register or signal a document  you have just lost or found",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Wherever you are ,notify  or register a lost or found document in simple steps",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF868686),
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 40,
              ),
              const Align(
                alignment: Alignment.bottomRight,
                child: Image(
                  image:
                      AssetImage('assets/images/image_onboarding_screen1.png'),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              CustomizedTextButton(
                text: 'Next',
                buttonWidth: 132,
                buttonHeight: 39,
                border: 'border',
                textColor: Colors.white,
                textFontSize: 18,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => OnboardingPageReward()),
                  );
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
