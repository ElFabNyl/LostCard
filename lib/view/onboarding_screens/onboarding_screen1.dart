
import 'package:flutter/material.dart';
import 'package:lostcard/view/onboarding_screens/onboarding_screen2.dart';
import '../reusable_widgets/customized_text_button.dart';

class OnboardingScreeen1 extends StatelessWidget{
  @override
    Widget build(BuildContext context) {
      return Scaffold(
          body: SafeArea(
            child: Container(

                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.bottomRight,
                      margin: EdgeInsets.all(20),
                      child: Text(
                        "Skip",
                        style: TextStyle(
                          fontSize: 15,
                          color: Color(0xFF868686),

                        ),
                      ),
                    ),
                    Container(

                      margin: EdgeInsets.fromLTRB(20, 120, 20, 0),

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

                    Container(

                      margin: EdgeInsets.fromLTRB(20, 20, 20, 0),

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


                    Container(

                      margin: const EdgeInsets.fromLTRB(20, 40, 40, 20),


                      alignment: Alignment.bottomRight,
                      child: const Image(
                        image: AssetImage('assets/images/image_onboarding_screen1.png'),


                      ),
                    ),

                    Container(child: CustomizedTextButton(text: 'Next', widget: OnboardinScreen2(),buttonWidth:132,buttonHeight: 39,),),

                  ],


                )
            ),
          ));
      throw UnimplementedError();
    }


}