import 'package:flutter/material.dart';
import 'package:lostcard/view/authentication/signin/signin.dart';
import 'package:lostcard/view/onboarding_screens/onboarding_page_registering_signaling.dart';
import 'package:lostcard/view/reusable_widgets/customized_text_button.dart';
import '../../constant/custom_color.dart';

class OnboardingPageSearching extends StatelessWidget {
  const OnboardingPageSearching({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
        margin: const EdgeInsets.fromLTRB(20, 20, 20, 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
               Align(
                alignment: Alignment.bottomRight,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: CustomizedTextButton(
                      text: 'Skip',
                      buttonWidth: 50,
                      buttonHeight: 40,
                      border: 'noBorder',
                      textColor: const Color(0xFF868686),
                      textFontSize: 15,
                      backgroundColor: CustomColor.primaryColor,
                      textAlignment: TextAlign.end,
                      onPressed: () {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignIn()),
                              (Route<dynamic>route) => false,
                        );
                      },
                    ),
                  ),


              ),
              const SizedBox(
                height: 140,
              ),
              const Text(
                "Easy way of searching your lost documents in Cameroon",
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
                "Search your document among thousands of registered ones",
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
              const SizedBox(
                height: 250,
                child:  Align(
                  alignment: Alignment.bottomRight,
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
                buttonWidth: 132,
                buttonHeight: 39,
                border: 'border',
                textColor: Colors.white,
                textFontSize: 18,
                backgroundColor: CustomColor.primaryColor,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const OnboardingPageRegisteringSignaling()),
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
