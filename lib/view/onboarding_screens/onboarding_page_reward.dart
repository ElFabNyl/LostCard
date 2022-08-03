import 'package:flutter/material.dart';
import '../../constant/custom_color.dart';
import '../reusable_widgets/customized_text_button.dart';
import 'package:lostcard/view/authentication/signin/signin.dart';

class OnboardingPageReward extends StatelessWidget {
  const OnboardingPageReward({Key? key}) : super(key: key);

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
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SignIn()),
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: 140,
              ),
              const Text(
                "Get rewarded",
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
                "you can save a life by registering the document you just found in the app and get rewarded",
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
                      AssetImage('assets/images/image_onboarding_screen2.png'),
                ),
              ),
              const SizedBox(
                height: 40,
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
                    MaterialPageRoute(builder: (context) => const SignIn()),
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
