
import 'package:flutter/material.dart';
import 'package:lostcard/view/onboarding_screens/onboarding_screen1.dart';

class CustomizedTextButton extends StatelessWidget{

  String text="";
  Widget widget;
  double buttonWidth;
  double buttonHeight;

  CustomizedTextButton({required this.text, required this.widget, required this.buttonWidth, required this.buttonHeight});

  @override
  Widget build(BuildContext context) {

    return(Container(margin: EdgeInsets.all(25),
      child: SizedBox(
        width: buttonWidth,
        height: buttonHeight,
        child: TextButton(

          child: Text(text,
            style: TextStyle(fontSize: 18.0, color: Colors
                .white),),
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Color(
                  0xFF082E02)),
              shape: MaterialStateProperty.all<
                  RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: BorderSide(color: Color(0xFF082E02),)

                ),


              )

          ), onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => widget),
          );
        },

        ),
      ),));


    throw UnimplementedError();
  }

}