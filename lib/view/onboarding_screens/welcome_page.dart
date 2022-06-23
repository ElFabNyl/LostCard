
import 'package:flutter/material.dart';
import 'package:lostcard/view/onboarding_screens/onboarding_screen1.dart';
import'package:lostcard/view/reusable_widgets/customized_text_button.dart';

class WelcomePage extends StatelessWidget {
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
                    "Easy way of searching your lost documents in Cameroon",
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
                    "Search your document amount thousands of registered ones",
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
                    image: AssetImage('assets/images/file_searching.png'),


                  ),
                ),


                Container(child: CustomizedTextButton(text: 'Next', widget: OnboardingScreeen1(),buttonWidth:132,buttonHeight: 39,),),




              ],


            )
          ),
        ));
    throw UnimplementedError();
  }
}