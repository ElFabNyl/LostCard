import 'package:flutter/material.dart';
import 'package:lostcard/view/onboarding_screens/onboarding_page_registering_signaling.dart';
import 'package:lostcard/view/reusable_widgets/customized_text_button.dart';

class OnboardingPageSearching extends StatelessWidget {
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
                "Easy way of searching your lost documents in Cameroon",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            const SizedBox(
              child: Text(
                "Search your document amount thousands of registered ones",
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
                  image: AssetImage('assets/images/file_searching.png'),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            CustomizedTextButton(
              text: 'Next',
              widget: OnboardingPageRegisteringSignaling(),
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
